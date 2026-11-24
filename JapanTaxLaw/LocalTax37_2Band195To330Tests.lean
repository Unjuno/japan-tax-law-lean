import JapanTaxLaw.LocalTax37_2Band195To330Spec

/-
# LocalTax37_2Band195To330Tests — kernel-decided boundary checks, 地方税法 第三十七条の二(11)
-/

namespace JapanTaxLaw.LocalTax37_2Band195To330

open JapanTaxLaw.TaxFinance

example : ¬ inBand 0 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : ¬ inBand 1 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : ¬ inBand 1_949_999 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : ¬ inBand 1_950_000 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : inBand 1_950_001 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : inBand 3_300_000 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : ¬ inBand 3_300_001 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : inBandBool 0 = false := by decide
example : inBandBool 1 = false := by decide
example : inBandBool 1_949_999 = false := by decide
example : inBandBool 1_950_000 = false := by decide
example : inBandBool 1_950_001 = true := by decide
example : inBandBool 3_300_000 = true := by decide
example : inBandBool 3_300_001 = false := by decide
example : inBand 1_950_001 ↔ specInBand 1_950_001 := agree_in_band 1_950_001
example (a : Money) : inBand a ↔ specInBand a := agree_in_band a

end JapanTaxLaw.LocalTax37_2Band195To330
