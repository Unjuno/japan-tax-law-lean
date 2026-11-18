import JapanTaxLaw.PublicPensionWithholding

/-!
# PublicPensionWithholding spec — independent integer restatement of 所得税法 art. 203の3

Sources (pinned; identical to PublicPensionWithholding.lean):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json

Independent restatement, derived from the statutory text itself rather than reusing the
implementation's `TaxRate.applyFloor` helper:

  * 「…当該各号に定める金額を控除した残額に百分の五 … の税率を乗じて計算した金額」
    → `specTax` = netAmount * 5 / 100 (integer floor).
  * 「十六万二千五百円に当該公的年金等の金額に係る月数を乗じて計算した金額」
    → `specThreshold` = 162500 * months.
  * 「第三号又は第六号 … 超える場合におけるその超える部分の金額 … については、百分の十」
    → `specWithExcess` = min-part at 5% + saturating excess at 10%.
  * 「第七号に掲げる公的年金等の当該残額については、百分の十」
    → `specSeventh` = netAmount * 10 / 100.

Scope boundary identical to the implementation: 政令の月割額・各号の該当性判定は NOT MODELLED.
-/

namespace JapanTaxLaw.PublicPensionWithholding

open JapanTaxLaw.TaxFinance

/-- Spec: 百分の五の切り捨て（独立整数定式）。 -/
def specPensionWithholdingTax (netAmount : Money) : Money :=
  netAmount * 5 / 100

/-- Spec: 十六万二千五百円 × 月数。 -/
def specExcessThreshold (months : Money) : Money :=
  162_500 * months

/-- Spec: 第三号・第六号の 5% + 超過分 10%（saturating）。 -/
def specPensionWithholdingWithExcess (netAmount months : Money) : Money :=
  min netAmount (specExcessThreshold months) * 5 / 100
    + (netAmount - specExcessThreshold months) * 10 / 100

/-- Spec: 第七号の 10%。 -/
def specPensionWithholdingSeventh (netAmount : Money) : Money :=
  netAmount * 10 / 100

/-- Spec: 区分 Bool は選択のみ（金額式には入れない）。 -/
def specPensionWithholdingByCategory
    (netAmount months : Money) (isThirdOrSixth isSeventh : Bool) : Money :=
  if isSeventh then specPensionWithholdingSeventh netAmount
  else if isThirdOrSixth then specPensionWithholdingWithExcess netAmount months
  else specPensionWithholdingTax netAmount

-- ==== independent spec points, all kernel-decided ====

example : specPensionWithholdingTax 1_000_000 = 50_000 := by decide
example : specPensionWithholdingTax 1_000_001 = 50_000 := by decide
example : specExcessThreshold 1 = 162_500 := by decide
example : specExcessThreshold 12 = 1_950_000 := by decide
example : specPensionWithholdingWithExcess 162_500 1 = 8_125 := by decide
example : specPensionWithholdingWithExcess 162_501 1 = 8_125 := by decide
example : specPensionWithholdingWithExcess 1_162_500 1 = 108_125 := by decide
example : specPensionWithholdingWithExcess 0 0 = 0 := by decide
example : specPensionWithholdingWithExcess 100_000 0 = 10_000 := by decide
example : specPensionWithholdingSeventh 1_000_000 = 100_000 := by decide

/-- Agreement between implementation and the independent integer Spec. -/
def agreePensionWithholdingPoints : Bool :=
  [ 0, 1, 1_000, 100_001, 162_500, 162_501, 1_162_500, 5_000_000 ].all fun n =>
    [ 0, 1, 12 ].all fun m =>
      pensionWithholdingTax n == specPensionWithholdingTax n
        && pensionWithholdingWithExcess n m == specPensionWithholdingWithExcess n m
        && pensionWithholdingSeventh n == specPensionWithholdingSeventh n

example : agreePensionWithholdingPoints = true := by decide

/-- Agreement of the Bool-driven rate-category selection. -/
def agreePensionWithholdingCategoryPoints : Bool :=
  [ false, true ].all fun t =>
    [ false, true ].all fun s =>
      [ (0, 0), (1_000_000, 1), (1_162_500, 1), (5_000_000, 12) ].all fun (n, m) =>
        pensionWithholdingByCategory ⟨n, m, t, s⟩
          == specPensionWithholdingByCategory n m t s

example : agreePensionWithholdingCategoryPoints = true := by decide

end JapanTaxLaw.PublicPensionWithholding
