import JapanTaxLaw.TaxFinance

/-!
# LocalGrantRevenueBase — 地方交付税法 art. 14（基準財政収入額の算定方法）のうち「交付金の百分の七十五に相当する額を控除」構造の bounded L4 モデル

Sources (pinned):

  Law id: 325AC0000000211
  Revision: 325AC0000000211_20261102_508AC0000000062
  Raw snapshot: data/raw/325AC0000000211_20261102_508AC0000000062.law.json
  (revision CurrentEnforced per data/INVENTORY.json; 地方交付税法)

  原文（担当範囲・正規化済み・UTF-8）: C3_localgrant.txt（第十四条、約 4982 文字）。
  本モジュールの doc-comment に載せる needle はすべてこのファイルから一字も変えず抽出。

Pinned bytes 逐語（needle evidence, transcribed one-for-one from the normalized source,
doc-comments only）:

  art. 14(1) 利子割（区分名: 利子割）
    「利子割の収入見込額については基準税率をもつて算定した当該道府県の利子割の収入見込額から利子割交付金の交付見込額の百分の七十五に相当する額を控除した額とし、」

  art. 14(1) 配当割（区分名: 配当割）
    「当該道府県の配当割の収入見込額から地方税法第七十一条の四十七の規定により市町村に対し交付するものとされる配当割に係る交付金（以下この項及び第三項において「配当割交付金」という。）の交付見込額の百分の七十五に相当する額を控除した額とし、」

  art. 14(1) 株式等譲渡所得割（区分名: 株式等譲渡所得割）
    「当該道府県の株式等譲渡所得割の収入見込額から同法第七十一条の六十七の規定により市町村に対し交付するものとされる株式等譲渡所得割に係る交付金（以下この項及び第三項において「株式等譲渡所得割交付金」という。）の交付見込額の百分の七十五に相当する額を控除した額とし、」

Modelled (only the explicit statutory arithmetic):

  * 控除率: 原文「百分の七十五」= 75% = **75/100**（型 `grantDeductionRate`）。
  * 共通関数 `netRevenue estimatedTax grant = estimatedTax - grantDeductionRate.applyFloor grant`。
    `applyFloor` は `TaxRate.applyFloor`（切り捨て）、減算は `Nat` の saturating 減算
    （控除額が収入見込額を超える場合は 0）。
  * 3 税目（利子割・配当割・株式等譲渡所得割）の各 def は共通関数 `netRevenue` を呼ぶだけ。
    - `interestSplitNetRevenue`（利子割）
    - `dividendSplitNetRevenue`（配当割）
    - `stockTransferIncomeSplitNetRevenue`（株式等譲渡所得割）

Scope & honest boundaries:

  * 基準税率・収入見込額・交付金見込額・（どの税目に該当するか）の判定は
    **caller-established**。Bool は金額式に入れず、認定は本モジュールの外で行う。
  * 端数処理は `TaxRate.applyFloor`（切り捨て）に委ねる。原文は「…に相当する額」とし、
    丸め細目の明記はない。他モジュールと同じ慣例を採用したことを明示する。
  * **NOT MODELLED**: 本文 art. 14 の他の税目・控除（法人事業税交付金の算定、
    地方消費税・ゴルフ場利用税・軽油引取税・市町村たばこ税の各 75% 控除、
    市町村たばこ税都道府県交付金／特別法人事業譲与税の「75% の額」、
    各種譲与税・国有資産等所在交付金の合算、基準税率自体の算定、
    第三項の算定基礎表）、ならびに経過措置・附則。これらは一切モデル化しない。
  * 転記監査は fidelity-only であり法的正しさを保証しない。
  * これは L4 の bounded スライスであり、**完成・網羅を主張しない**。

Pinned evidence in doc-comments only; all theorems claim model properties only.
All arithmetic is total Nat.

-/

namespace JapanTaxLaw.LocalGrantRevenueBase

open JapanTaxLaw.TaxFinance

-- ============================================================
-- 原文の定数と共通算定式
-- ============================================================

/-- 原文「百分の七十五」= 75/100。分母に正の証明を持つ `TaxRate`。 -/
def grantDeductionRate : TaxRate := ⟨75, 100, by decide⟩

/-- 控除後収入見込額 = 収入見込額 − 交付金見込額×75/100（切り捨て）。
    Nat の saturating 減算なので、控除額が収入見込額を超える場合は 0。
    基準税率・収入見込額・交付金見込額・該当性は caller-established。 -/
def netRevenue (estimatedTax grant : Money) : Money :=
  estimatedTax - grantDeductionRate.applyFloor grant

-- ==== 3 税目の def（いずれも共通関数 netRevenue を呼ぶ） ====

/-- 利子割（区分名: 利子割）: 収入見込額から利子割交付金の 75% 相当額を控除。
    式は共通関数 `netRevenue` に委譲。引数は caller-established。 -/
def interestSplitNetRevenue (estimatedTax grant : Money) : Money :=
  netRevenue estimatedTax grant

/-- 配当割（区分名: 配当割）: 収入見込額から配当割交付金の 75% 相当額を控除。
    式は共通関数 `netRevenue` に委譲。引数は caller-established。 -/
def dividendSplitNetRevenue (estimatedTax grant : Money) : Money :=
  netRevenue estimatedTax grant

/-- 株式等譲渡所得割（区分名: 株式等譲渡所得割）: 収入見込額から
    株式等譲渡所得割交付金の 75% 相当額を控除。
    式は共通関数 `netRevenue` に委譲。引数は caller-established。 -/
def stockTransferIncomeSplitNetRevenue (estimatedTax grant : Money) : Money :=
  netRevenue estimatedTax grant

-- ==== verified facts (numDen / positivity / connection) ====

theorem grantDeductionRate_numDen : grantDeductionRate.numDen = (75, 100) := rfl

theorem grantDeductionRate_den_pos : 0 < grantDeductionRate.den := by decide

theorem netRevenue_eq (estimatedTax grant : Money) :
    netRevenue estimatedTax grant = estimatedTax - grant * 75 / 100 := rfl

/-- saturating 減算なので控除後額は収入見込額を超えない。 -/
theorem netRevenue_le_estimatedTax (estimatedTax grant : Money) :
    netRevenue estimatedTax grant ≤ estimatedTax := by
  exact Nat.sub_le _ _

/-- 控除後額は収入見込額について単調（交付金見込額は固定）。 -/
theorem netRevenue_mono_est {a b : Money} (h : a ≤ b) (grant : Money) :
    netRevenue a grant ≤ netRevenue b grant := by
  exact Nat.sub_le_sub_right h _

/-- 控除額が収入見込額以上なら控除後額は 0（saturating）。 -/
theorem netRevenue_eq_zero_of_deduction_ge (estimatedTax grant : Money)
    (h : grantDeductionRate.applyFloor grant ≥ estimatedTax) :
    netRevenue estimatedTax grant = 0 := by
  exact Nat.sub_eq_zero_of_le h

theorem interestSplitNetRevenue_eq (estimatedTax grant : Money) :
    interestSplitNetRevenue estimatedTax grant = estimatedTax - grant * 75 / 100 := rfl

theorem dividendSplitNetRevenue_eq (estimatedTax grant : Money) :
    dividendSplitNetRevenue estimatedTax grant = estimatedTax - grant * 75 / 100 := rfl

theorem stockTransferIncomeSplitNetRevenue_eq (estimatedTax grant : Money) :
    stockTransferIncomeSplitNetRevenue estimatedTax grant = estimatedTax - grant * 75 / 100 := rfl

-- ==== kernel-decided smoke checks ====

-- 定数 75/100 と正数性
example : grantDeductionRate.numDen = (75, 100) := by decide
example : grantDeductionRate.den = 100 := by decide
example : grantDeductionRate.applyFloor 100 = 75 := by decide
example : grantDeductionRate.applyFloor 101 = 75 := by decide  -- 端数切り捨て

-- 利子割（0 / 控除>見込額で 0 / 通常 / 端数）
example : interestSplitNetRevenue 0 0 = 0 := by decide
example : interestSplitNetRevenue 0 100 = 0 := by decide
example : interestSplitNetRevenue 74 100 = 0 := by decide
example : interestSplitNetRevenue 75 100 = 0 := by decide
example : interestSplitNetRevenue 76 100 = 1 := by decide
example : interestSplitNetRevenue 1000 100 = 925 := by decide
example : interestSplitNetRevenue 1000 0 = 1000 := by decide
example : interestSplitNetRevenue 101 100 = 26 := by decide  -- 101-75

-- 配当割（共通関数と同一）
example : dividendSplitNetRevenue 0 100 = 0 := by decide
example : dividendSplitNetRevenue 74 100 = 0 := by decide
example : dividendSplitNetRevenue 1000 100 = 925 := by decide
example : dividendSplitNetRevenue 101 100 = 26 := by decide

-- 株式等譲渡所得割（共通関数と同一）
example : stockTransferIncomeSplitNetRevenue 0 100 = 0 := by decide
example : stockTransferIncomeSplitNetRevenue 74 100 = 0 := by decide
example : stockTransferIncomeSplitNetRevenue 1000 100 = 925 := by decide
example : stockTransferIncomeSplitNetRevenue 101 100 = 26 := by decide

end JapanTaxLaw.LocalGrantRevenueBase
