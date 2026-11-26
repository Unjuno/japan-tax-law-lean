import JapanTaxLaw.ThresholdDeductionsSpec

/-! Regression tests — threshold boundaries and universal table agreement. -/

namespace JapanTaxLaw.ThresholdDeductions

example : spouseDeduction 9_500_000 false = 260_000 := by decide
example : spouseDeduction 9_500_001 true = 160_000 := by decide
example : spouseDeduction 10_000_001 false = 0 := by decide
example : longTermDeduction 15_000 = 12_500 := by decide

example : spouseDeduction 8_765_432 false = specSpouse 8_765_432 false := spouse_agrees 8_765_432 false
example : spouseDeduction 9_700_001 true = specSpouse 9_700_001 true := spouse_agrees 9_700_001 true
example : longTermDeduction 17_777 = specLongTerm 17_777 := longTerm_agrees 17_777

end JapanTaxLaw.ThresholdDeductions
