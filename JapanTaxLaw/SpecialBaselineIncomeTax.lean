import JapanTaxLaw.TaxFinance

/-!
# SpecialBaselineIncomeTax — 租税特別措置法 art.41の19（特定の基準所得金額の課税の特例）の bounded L4 モデル

Sources (pinned):

  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/332AC0000000026_20261101_507AC0000000013.law.json
  (租税特別措置法)

原文（担当範囲・正規化済み・UTF-8）: C5_base_income.txt（第四十一条の十九, LEN 3353）。

Pinned bytes 逐語（needle evidence, transcribed one-for-one from the normalized source,
doc-comments only）:

  art. 41の19 第1項
    「（特定の基準所得金額の課税の特例）第四十一条の十九個人でその者のその年分の基準所得金額が三億三千万円を超えるもの（第四項において「特例対象者」という。）については、」
    「については、当該超える部分の金額の百分の二十二・五に相当する金額からその年分の基準所得税額を控除した金額に相当する所得税を課する。」
  art. 41の19 第2項 / 第3項（基準所得金額・基準所得税額の定義、NOT MODELLED の根拠）
    「２前項に規定する基準所得金額とは、次に掲げる金額の合計額をいう。一第八条の五第一項の規定の適用がないものとして計算した所得税法第二十二条」
    「３第一項に規定する基準所得税額とは、次の各号に掲げる者の区分に応じ当該各号に定める所得税の額（国税通則法第二条第四号に規定する附帯税の額を除く。）をいう。」
    「（特別控除に関する規定（第三十三条の四第一項、第三十四条第一項、第三十四条の二第一項、第三十四条の三第一項、第三十五条第一項、第三十五条の二第一項又は第三十五条の三第一項の規定その他政令で定める規定をいう。」

Modelled (only the explicit statutory arithmetic of 第1項):

  * 「基準所得金額が三億三千万円を超える」の閾値 = `thresholdAmount` = 330_000_000（三億三千万円）。
  * 「当該超える部分の金額」= `excessAmount baselineIncome` = `baselineIncome - thresholdAmount`
    （Nat の saturating 減算。閾値以下なら 0）。
  * 「百分の二十二・五」= 22.5% = **225/1000**（小数点表記。**2250/1000 は 10 倍過大**で誤り）。
    率を `specialRate : TaxRate` = `⟨225, 1000, by decide⟩` として保持し、
    適用額は切り捨て（floor）で `amount * 225 / 1000`。smoke で `base=1000 → 225` を確認する。
  * 「基準所得税額を控除した金額」= `specialBaselineIncomeTax` =
    `applySpecialRate (excessAmount baselineIncome) - baselineTaxAmount`（Nat saturating 減算、
    控除額が課税額以上なら 0）。
  * 「特例対象者」該当性（3億3千万超）は **caller-established Bool** として
    `specialBaselineIncomeTaxSelected` の `applicable` 引数で選択する（金额から自動判定しない）。

Scope & honest boundaries:

  * 基準所得金額・基準所得税額・「特例対象者」該当性は **caller-established**。
    Bool を金額算術に混入させず、認定は本モジュール外で行う。
  * **NOT MODELLED**: 第2項の基準所得金額の算定（一号から九号までの各所得の合計、
    特別控除に関する規定、政令で定める規定）、および第3項の基準所得税額の各号別の
    具体的算定。これらは他条文・政令への参照が多数にわたり、本 L4 スライスの対象外。
  * 第4項（利子等・配当等への第八条の五等の不適用）および第5項（読替え規定）も NOT MODELLED。
  * Money = Nat。税率適用は切り捨て（floor）を modeling choice とし、
    丸め規則を黙って決め付けないよう `TaxRate.applyFloor` を経由させる。
  * 転記監査は fidelity-only であり法的正しさを保証しない。
  * Pinned evidence in doc-comments only; all theorems claim model properties only.

-/


namespace JapanTaxLaw.SpecialBaselineIncomeTax

open JapanTaxLaw.TaxFinance

-- ============================================================
-- art. 41の19 第1項 — 閾値・率・超える部分・控除
-- ============================================================

/-- art. 41の19 第1項: 「三億三千万円」の閾値。 -/
def thresholdAmount : Money := 330_000_000

-- positivity / smoke
example : thresholdAmount = 330_000_000 := by decide

/-- art. 41の19 第1項: 「百分の二十二・五」= 22.5% = 225/1000。
    2250/1000（10 倍過大）ではないことに注意。 -/
def specialRate : TaxRate := ⟨225, 1000, by decide⟩

-- positivity / smoke
example : specialRate.num = 225 := rfl
example : specialRate.den = 1000 := rfl
example : 0 < specialRate.den := specialRate.den_pos

/-- art. 41の19 第1項: 「百分の二十二・五に相当する金額」を税率適用（切り捨て）で求める。
    smoke: `applySpecialRate 1000 = 225`（225/1000 の転記確認、10 倍誤りなら 2250 になる）。 -/
def applySpecialRate (amount : Money) : Money :=
  specialRate.applyFloor amount

-- positivity / smoke
example : applySpecialRate 0 = 0 := by decide
example : applySpecialRate 1000 = 225 := by decide
example : applySpecialRate 1 = 0 := by decide

/-- art. 41の19 第1項: 「基準所得金額が三億三千万円を超える」部分の金額。
    Nat saturating 減算なので閾値以下なら 0。 -/
def excessAmount (baselineIncome : Money) : Money :=
  baselineIncome - thresholdAmount

-- positivity / smoke
example : excessAmount 330_000_000 = 0 := by decide
example : excessAmount 330_001_000 = 1000 := by decide

/-- art. 41の19 第1項: 「当該超える部分の金額の百分の二十二・五に相当する金額から
    その年分の基準所得税額を控除した金額に相当する所得税」。
    Nat saturating 減算で、基準所得税額が課税額以上なら 0。 -/
def specialBaselineIncomeTax (baselineIncome baselineTaxAmount : Money) : Money :=
  applySpecialRate (excessAmount baselineIncome) - baselineTaxAmount

-- positivity / smoke
example : specialBaselineIncomeTax 330_000_000 0 = 0 := by decide
example : specialBaselineIncomeTax 330_001_000 0 = 225 := by decide
example : specialBaselineIncomeTax 330_001_000 300 = 0 := by decide

/-- art. 41の19 第1項: 「特例対象者」該当性（3億3千万超）は caller-established Bool。
    `applicable = false` なら課税せず 0、`true` なら第1項の算術を適用する。 -/
def specialBaselineIncomeTaxSelected
    (applicable : Bool) (baselineIncome baselineTaxAmount : Money) : Money :=
  if applicable then specialBaselineIncomeTax baselineIncome baselineTaxAmount else 0

-- positivity / smoke
example : specialBaselineIncomeTaxSelected false 330_001_000 0 = 0 := by decide
example : specialBaselineIncomeTaxSelected true 330_001_000 0 = 225 := by decide

-- ==== verified facts (model properties only) ====

theorem thresholdAmount_eq : thresholdAmount = 330_000_000 := rfl

theorem specialRate_numDen : (specialRate.num, specialRate.den) = (225, 1000) := rfl

theorem applySpecialRate_eq (amount : Money) :
    applySpecialRate amount = amount * 225 / 1000 := rfl

theorem excessAmount_eq (baselineIncome : Money) :
    excessAmount baselineIncome = baselineIncome - thresholdAmount := rfl

theorem specialBaselineIncomeTax_eq (baselineIncome baselineTaxAmount : Money) :
    specialBaselineIncomeTax baselineIncome baselineTaxAmount =
      (baselineIncome - thresholdAmount) * 225 / 1000 - baselineTaxAmount := rfl

theorem specialBaselineIncomeTax_zero_tax (baselineIncome : Money) :
    specialBaselineIncomeTax baselineIncome 0 = applySpecialRate (excessAmount baselineIncome) := rfl

theorem specialBaselineIncomeTax_le_applied (baselineIncome baselineTaxAmount : Money) :
    specialBaselineIncomeTax baselineIncome baselineTaxAmount ≤
      applySpecialRate (excessAmount baselineIncome) :=
  Nat.sub_le _ _

theorem specialBaselineIncomeTax_eq_zero_of_applied_le
    (baselineIncome baselineTaxAmount : Money)
    (h : applySpecialRate (excessAmount baselineIncome) ≤ baselineTaxAmount) :
    specialBaselineIncomeTax baselineIncome baselineTaxAmount = 0 :=
  Nat.sub_eq_zero_of_le h

theorem selected_false_eq_zero (baselineIncome baselineTaxAmount : Money) :
    specialBaselineIncomeTaxSelected false baselineIncome baselineTaxAmount = 0 := rfl

theorem selected_true_eq (baselineIncome baselineTaxAmount : Money) :
    specialBaselineIncomeTaxSelected true baselineIncome baselineTaxAmount =
      specialBaselineIncomeTax baselineIncome baselineTaxAmount := rfl

end JapanTaxLaw.SpecialBaselineIncomeTax
