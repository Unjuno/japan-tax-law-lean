import JapanTaxLaw.LocalTax37_2Band900To1800Spec

/-
# LocalTax37_2Band900To1800Tests — kernel-decided boundary checks, 地方税法 第三十七条の二(11)
-/

namespace JapanTaxLaw.LocalTax37_2Band900To1800

open JapanTaxLaw.TaxFinance

example : ¬ inBand 0 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : ¬ inBand 1 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : ¬ inBand 8_999_999 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : ¬ inBand 9_000_000 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : inBand 9_000_001 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : inBand 18_000_000 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : ¬ inBand 18_000_001 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : inBandBool 0 = false := by decide
example : inBandBool 1 = false := by decide
example : inBandBool 8_999_999 = false := by decide
example : inBandBool 9_000_000 = false := by decide
example : inBandBool 9_000_001 = true := by decide
example : inBandBool 18_000_000 = true := by decide
example : inBandBool 18_000_001 = false := by decide
example : inBand 9_000_001 ↔ specInBand 9_000_001 := agree_in_band 9_000_001
example (a : Money) : inBand a ↔ specInBand a := agree_in_band a

end JapanTaxLaw.LocalTax37_2Band900To1800
