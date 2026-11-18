import JapanTaxLaw.TaxFinance
import JapanTaxLaw.ConsumptionTaxRate

/-!
# ConsumptionTaxInputCredit — 消費税法 art. 30(1)（仕入れに係る消費税額の控除）L4 モデル

Source (pinned):

  Law id: 363AC0000000108
  Revision: 363AC0000000108_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 25DCCEBFFB6690902C117A4AB9C16E4D64DB087BBA6D184A10EA6AEB58AB4A82
  (data/raw/363AC0000000108_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as ConsumptionTaxRate / ConsumptionTaxableBase / ConsumptionTaxImportBase)

Models the computable core of art. 30(1) — pinned bytes 逐語:

  「事業者（第九条第一項本文の規定により消費税を納める義務が免除される事業者を除く。）が、
    国内において行う課税仕入れ（特定課税仕入れに該当するものを除く。）若しくは特定課税仕入れ
    又は保税地域から引き取る課税貨物については、…第四十五条第一項第二号に掲げる消費税額
    （以下この章において「課税標準額に対する消費税額」という。）から、
    当該課税期間中に国内において行つた課税仕入れに係る消費税額（…適格請求書…の記載事項を
    基礎として計算した金額その他の政令で定めるところにより計算した金額をいう。）、
    当該課税期間中に国内において行つた特定課税仕入れに係る消費税額
    （当該特定課税仕入れに係る支払対価の額に百分の七・八を乗じて算出した金額をいう。）
    及び当該課税期間における保税地域からの引取りに係る課税貨物（…）につき課された又は
    課されるべき消費税額（附帯税の額に相当する額を除く。）の合計額を控除する。」

Computation (Money = Nat, no coercion):

  specifiedPurchaseTax paid = standardRate.applyFloor paid   -- 支払対価 × 7.8%（切り捨て）
  totalInputTax domestic specified importTax = domestic + specified + importTax
  taxAfterCredit output domestic specified paid importTax =
    output - totalInputTax domestic (specifiedPurchaseTax paid) importTax   -- saturating Nat subtraction

Scope & honest boundaries:

* 「課税標準額に対する消費税額」(art. 45(1)(2)) は caller-established Money（本モジュールでは
  課税標準額からの算出はしない — art. 29 税率と丸めは ConsumptionTaxRate.lean の射程）。
* 「課税仕入れに係る消費税額」は適格請求書の記載事項と政令計算に依存 — caller-established Money。
* 「課税貨物の消費税額」は附帯税除きの caller-established Money（ConsumptionTaxImportBase の
  課税標準に art. 29 税率を乗じた結果を渡す想定だが、本モジュールは受け取るだけ）。
* 免税事業者（art. 9(1) 本文）の適用除外は caller-established Bool（式には入れない — 法令は
  「控除する」という金額定義であり、条件付きゼロではない）。
* **Underflow / 還付**: 控除額が output を超える場合、実際には還付（art. 43 等）が生じるが、
  それは本スライスの射程外。Nat の saturating subtraction を使い、
  `taxAfterCredit_exact` は input ≤ output のときだけ正確であることを証明する。
  output < input のときに 0 を返すのは「還付なし」を主張するものではない。
* art. 30(2)（課税売上高 5億円超／課税売上割合 95%未満の按分）は `Apportionment` 名前空間でモデル化済み（needApportionment / commonPortion / apportionedIfSeparated / apportionedIfUnseparated）。(3)〜(12) — NOT YET COVERED。
* 転記監査は fidelity-only であり法的正しさを保証しない。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 30(1) — 特定課税仕入れに係る消費税額 = 支払対価 × 百分の七・八（切り捨て）。
    `standardRate` (78/1000) は ConsumptionTaxRate.lean の art. 29 一号と同一。 -/
def specifiedPurchaseTax (paidConsideration : Money) : Money :=
  standardRate.applyFloor paidConsideration

/-- art. 30(1) — 控除する課税仕入れ等の税額の合計。 -/
def totalInputTax (domesticInputTax importGoodsTax : Money) (paidConsideration : Money) : Money :=
  domesticInputTax + specifiedPurchaseTax paidConsideration + importGoodsTax

/-- art. 30(1) — 課税標準額に対する消費税額から合計額を控除した額。
    Nat の saturating subtraction。input ≤ output のときのみ法的に正確（下記定理）。 -/
def taxAfterCredit (outputTax domesticInputTax : Money) (paidConsideration importGoodsTax : Money) : Money :=
  outputTax - totalInputTax domesticInputTax importGoodsTax paidConsideration

-- ==== verified facts ====

theorem specifiedPurchaseTax_eq (paid : Money) :
    specifiedPurchaseTax paid = paid * 78 / 1000 := by
  rfl

/-- 特定課税仕入れ税額は支払対価を超えない（7.8% < 100%）。 -/
theorem specifiedPurchaseTax_le (paid : Money) : specifiedPurchaseTax paid ≤ paid := by
  unfold specifiedPurchaseTax standardRate TaxRate.applyFloor
  have hmul : paid * 78 ≤ paid * 1000 := Nat.mul_le_mul_left paid (by decide)
  have hdiv : paid * 78 / 1000 ≤ paid * 1000 / 1000 := Nat.div_le_div_right hmul
  simpa using hdiv

/-- 合計額は domestic + specified + import（結合順を固定）。 -/
theorem totalInputTax_eq (dom imp paid : Money) :
    totalInputTax dom imp paid = dom + specifiedPurchaseTax paid + imp := rfl

/-- 合計額は各構成要素以上。 -/
theorem domestic_le_totalInputTax (dom imp paid : Money) :
    dom ≤ totalInputTax dom imp paid := by
  unfold totalInputTax
  exact Nat.le_trans (Nat.le_add_right dom (specifiedPurchaseTax paid))
    (Nat.le_add_right (dom + specifiedPurchaseTax paid) imp)

theorem import_le_totalInputTax (dom imp paid : Money) :
    imp ≤ totalInputTax dom imp paid := by
  unfold totalInputTax
  exact Nat.le_add_left imp (dom + specifiedPurchaseTax paid)

/-- **正確性条件**: 控除額が output 以下のとき、saturating subtraction は通常の減算と一致。 -/
theorem taxAfterCredit_exact (output dom paid imp : Money)
    (_h : totalInputTax dom imp paid ≤ output) :
    taxAfterCredit output dom paid imp = output - totalInputTax dom imp paid := rfl

/-- 控除額が output 以下のとき、控除後税額は output 以下。 -/
theorem taxAfterCredit_le_output (output dom paid imp : Money)
    (h : totalInputTax dom imp paid ≤ output) :
    taxAfterCredit output dom paid imp ≤ output := by
  rw [taxAfterCredit_exact _ _ _ _ h]
  exact Nat.sub_le _ _

/-- 控除額が output を超えるときは 0（還付は射程外 — doc-comment 参照）。 -/
theorem taxAfterCredit_zero_of_over (output dom paid imp : Money)
    (h : output ≤ totalInputTax dom imp paid) :
    taxAfterCredit output dom paid imp = 0 := by
  unfold taxAfterCredit
  exact Nat.sub_eq_zero_of_le h

-- ==== kernel-decided smoke checks ====

-- 特定課税仕入れ: 100,000 × 7.8% = 7,800
example : specifiedPurchaseTax 100_000 = 7_800 := by decide
example : specifiedPurchaseTax 0 = 0 := by decide
example : specifiedPurchaseTax 1 = 0 := by decide  -- 切り捨て
-- 合計: domestic 20,000 + specified 7,800 + import 12,000 = 39,800
example : totalInputTax 20_000 12_000 100_000 = 39_800 := by decide
-- 控除: output 100,000 - 39,800 = 60,200
example : taxAfterCredit 100_000 20_000 100_000 12_000 = 60_200 := by decide
-- underflow: output 10,000 < input 39,800 → 0（還付は射程外）
example : taxAfterCredit 10_000 20_000 100_000 12_000 = 0 := by decide


-- ============================================================
-- art. 30(2) — 課税売上割合による按分（pinned bytes 逐語）
--
-- 「同項に規定する課税期間における課税売上高が五億円を超えるとき、又は当該課税期間における
--   課税売上割合が百分の九十五に満たないときは、…課税仕入れ等の税額…の合計額は、
--   同項の規定にかかわらず、次の各号に掲げる場合の区分に応じ当該各号に定める方法により
--   計算した金額とする。
--   一 …課税資産の譲渡等にのみ要するもの、課税資産の譲渡等以外の資産の譲渡等…
--         …に共通して要するものにその区分が明らかにされている場合
--      イに掲げる金額にロに掲げる金額を加算する方法
--      イ 課税資産の譲渡等にのみ要する…税額の合計額
--      ロ 課税資産の譲渡等とその他の資産の譲渡等に共通して要する…税額の合計額に
--          課税売上割合を乗じて計算した金額
--   二 前号に掲げる場合以外の場合
--      当該課税期間における課税仕入れ等の税額の合計額に課税売上割合を乗じて計算する方法」
--
-- Honest boundaries:
--   * 課税売上割合は caller-established TaxRate (num/den)。その算定（課税売上高/総売上高、
--     95% special rule、政令の価額算定）は art. 30(6)(7) 等の射程で本モジュール外。
--   * 課税売上高 (Money) は caller-established。
--   * 「区分が明らかにされている」かどうかは caller-established Bool。
--   * 税率適用の端数は切り捨て（TaxRate.applyFloor）。政令の丸め細目は射程外。
--   * art. 30(3)〜(12) — NOT YET COVERED。
namespace Apportionment

open JapanTaxLaw.TaxFinance

/-- art. 30(2) — 按分が必要か: 課税売上高 > 5億 または 課税売上割合 < 95%。
    95% 判定は交差掛け算 num*100 < 95*den（den>0 は TaxRate の不変条件）。 -/
def needsApportionment (taxableSalesAmount : Money) (ratio : TaxRate) : Bool :=
  decide (taxableSalesAmount > 500_000_000 || ratio.num * 100 < 95 * ratio.den)

/-- art. 30(2)一ロ — 共通税額 × 課税売上割合。 -/
def commonPortion (commonTax : Money) (ratio : TaxRate) : Money :=
  ratio.applyFloor commonTax

/-- art. 30(2)一 — 区分明らか: 課税資産のみ + 共通 × 割合。 -/
def apportionedIfSeparated (exclusiveTax commonTax : Money) (ratio : TaxRate) : Money :=
  exclusiveTax + commonPortion commonTax ratio

/-- art. 30(2)二 — 区分不明: 合計 × 割合。 -/
def apportionedIfUnseparated (totalInputTaxes : Money) (ratio : TaxRate) : Money :=
  ratio.applyFloor totalInputTaxes

-- ==== verified facts ====

theorem needsApportionment_of_large_sales (sales : Money) (ratio : TaxRate) (h : sales > 500_000_000) :
    needsApportionment sales ratio = true := by
  unfold needsApportionment
  simp [h]

theorem needsApportionment_of_low_ratio (sales : Money) (ratio : TaxRate)
    (h : ratio.num * 100 < 95 * ratio.den) :
    needsApportionment sales ratio = true := by
  unfold needsApportionment
  simp [h]

-- ==== kernel-decided smoke checks ====

def ratio95 : TaxRate := ⟨95, 100, by decide⟩
def ratio90 : TaxRate := ⟨90, 100, by decide⟩

example : needsApportionment 100_000_000 ratio95 = false := by decide
example : needsApportionment 500_000_001 ratio95 = true := by decide
example : needsApportionment 100_000_000 ratio90 = true := by decide
example : commonPortion 200_000 ratio95 = 190_000 := by decide
example : apportionedIfSeparated 100_000 200_000 ratio95 = 290_000 := by decide
example : apportionedIfUnseparated 300_000 ratio90 = 270_000 := by decide

end Apportionment

end JapanTaxLaw
