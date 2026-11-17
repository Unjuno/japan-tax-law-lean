import JapanTaxLaw.LocalTaxInsuranceEstimate

/-!
# LocalTaxInsuranceEstimate tests — 第五十六条の八十九の六 kernel-decide smoke

Decidable smoke tests for the estimated insurance tax computation, pinned to

  Law id: 325CO0000000245
  Revision: 325CO0000000245_20261101_508CO0000000083

境界: 税額 0、乗数 0（委譲元要約の「納期数 0」に対応）、割り切れない額、
百円未満の切り捨て、除数を月数に変えた場合。
すべて `by decide` の kernel-decide であり、法的判断は含まない。
-/

namespace JapanTaxLaw.LocalTaxInsuranceEstimate

-- 百円未満切り捨ての境界
example : estimateHundredYenFloor 0 = 0 := by decide
example : estimateHundredYenFloor 99 = 0 := by decide
example : estimateHundredYenFloor 100 = 100 := by decide
example : estimateHundredYenFloor 1199 = 1100 := by decide

-- 境界: 税額 0
example : standardInsuranceTaxEstimate 0 = 0 := by decide
example : insuranceTaxEstimate 0 12 = 0 := by decide
example : insuranceTaxEstimateWithMultiplier 0 7 12 = 0 := by decide

-- 境界: 乗数 0（「納期数 0」読みに対応）
example : insuranceTaxEstimateWithMultiplier 120000 12 0 = 0 := by decide
example : insuranceTaxEstimateWithMultiplier 120000 0 0 = 0 := by decide

-- 境界: 割り切れない額（Nat 除算は切り捨て）
example : standardInsuranceTaxEstimate 100 = 0 := by decide
example : standardInsuranceTaxEstimate 1199 = 1100 := by decide
example : standardInsuranceTaxEstimate 199 = 100 := by decide

-- 百円未満の端数切り捨て（割り切れるが百円未満）
example : standardInsuranceTaxEstimate 12 = 0 := by decide
example : standardInsuranceTaxEstimate 1200 = 1200 := by decide
example : standardInsuranceTaxEstimate 12000 = 12000 := by decide

-- 除数を月数に変えた場合（caller-established）
example : insuranceTaxEstimate 120000 6 = 240000 := by decide
example : insuranceTaxEstimate 50000 7 = 85700 := by decide
example : insuranceTaxEstimate 999999 3 = 3999900 := by decide

-- 原文忠実形（乗数十二）と一般形の一致
example : insuranceTaxEstimate 1199 12 =
    insuranceTaxEstimateWithMultiplier 1199 12 12 := by decide
example : insuranceTaxEstimate 120000 12 =
    insuranceTaxEstimateWithMultiplier 120000 12 12 := by decide

end JapanTaxLaw.LocalTaxInsuranceEstimate
