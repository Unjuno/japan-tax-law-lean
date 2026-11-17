import JapanTaxLaw.LocalTaxInsuranceEstimate

/-!
# LocalTaxInsuranceEstimate spec — 独立整数定式（第五十六条の八十九の六）

Sources (pinned; identical to LocalTaxInsuranceEstimate.lean):

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083
  (data/raw/325CO0000000245_20261101_508CO0000000083.law.json)

原文の算定中核（一字も変更せず）:

  「当該年度の前年度分の国民健康保険税額を十二（…月数）で除して得た額に十二を乗じて得た額
    （当該金額に百円未満の端数があるときは、その端数金額を切り捨てた金額）とする。」

Spec は実装とは独立に整数式として書き直したもの（接頭辞 `spec`）。
`agree*` は両者の定数一致を `by decide` で確認するものであり、
法的意味の等価証明ではない。転記監査は fidelity-only である。
-/

namespace JapanTaxLaw.LocalTaxInsuranceEstimate

/-- Spec: 百円未満の端数切り捨て（独立定式）。 -/
def specEstimateHundredYenFloor (x : Nat) : Nat := x / 100 * 100

/-- Spec: 一般形（独立定式）。Nat 除算は切り捨て。 -/
def specInsuranceTaxEstimateWithMultiplier (priorYearTax divisor multiplier : Nat) : Nat :=
  specEstimateHundredYenFloor ((priorYearTax / divisor) * multiplier)

/-- Spec: pinned 原文（十二で除し十二を乗じる）。 -/
def specInsuranceTaxEstimate (priorYearTax divisor : Nat) : Nat :=
  specInsuranceTaxEstimateWithMultiplier priorYearTax divisor 12

/-- Spec: 通常ケース（除数十二）。 -/
def specStandardInsuranceTaxEstimate (priorYearTax : Nat) : Nat :=
  specInsuranceTaxEstimate priorYearTax 12

-- ==== spec points, all kernel-decided ====

example : specEstimateHundredYenFloor 0 = 0 := by decide
example : specEstimateHundredYenFloor 99 = 0 := by decide
example : specEstimateHundredYenFloor 100 = 100 := by decide
example : specEstimateHundredYenFloor 1199 = 1100 := by decide

example : specStandardInsuranceTaxEstimate 0 = 0 := by decide
example : specStandardInsuranceTaxEstimate 100 = 0 := by decide
example : specStandardInsuranceTaxEstimate 1199 = 1100 := by decide
example : specStandardInsuranceTaxEstimate 1200 = 1200 := by decide
example : specStandardInsuranceTaxEstimate 120000 = 120000 := by decide

example : specInsuranceTaxEstimate 120000 6 = 240000 := by decide
example : specInsuranceTaxEstimateWithMultiplier 120000 12 3 = 30000 := by decide

-- ==== agreement checks (by decide) ====

/-- 百円未満切り捨て: 実装 ≡ spec。 -/
def agreeEstimateHundredYenFloorPoints : Bool :=
  [0, 1, 99, 100, 101, 1199, 1200, 12_000, 1_000_000, 99_999_999].all fun x =>
    specEstimateHundredYenFloor x == estimateHundredYenFloor x

example : agreeEstimateHundredYenFloorPoints = true := by decide

/-- 原文忠実形（十二で除し十二を乗じる）: 実装 ≡ spec。 -/
def agreeStandardInsuranceEstimatePoints : Bool :=
  [0, 1, 12, 99, 100, 199, 1_199, 1_200, 12_000, 120_000,
   1_000_000, 99_999_999].all fun x =>
    specStandardInsuranceTaxEstimate x == standardInsuranceTaxEstimate x

example : agreeStandardInsuranceEstimatePoints = true := by decide

/-- 除数を変えた場合（月数ケースを含む）: 実装 ≡ spec。 -/
def agreeInsuranceEstimateDivisorPoints : Bool :=
  [ (0, 12), (0, 0), (100, 12), (1_199, 12), (120_000, 12),
    (120_000, 6), (50_000, 7), (999_999, 3) ].all fun (p, d) =>
    specInsuranceTaxEstimate p d == insuranceTaxEstimate p d

example : agreeInsuranceEstimateDivisorPoints = true := by decide

/-- 一般形（乗数を caller-established で受け取る）: 実装 ≡ spec。 -/
def agreeInsuranceEstimateWithMultiplierPoints : Bool :=
  [ (0, 0, 12), (0, 12, 0), (100, 12, 12), (1_199, 12, 12),
    (120_000, 12, 3), (36_000, 12, 5), (50_000, 7, 12) ].all fun (p, d, m) =>
    specInsuranceTaxEstimateWithMultiplier p d m == insuranceTaxEstimateWithMultiplier p d m

example : agreeInsuranceEstimateWithMultiplierPoints = true := by decide

end JapanTaxLaw.LocalTaxInsuranceEstimate
