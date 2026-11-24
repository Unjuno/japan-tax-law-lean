import JapanTaxLaw.LocalTax37_2Band1800To4000Spec

/-
# LocalTax37_2Band1800To4000Tests — kernel-decided boundary checks, 地方税法 第三十七条の二(11)
-/

namespace JapanTaxLaw.LocalTax37_2Band1800To4000

open JapanTaxLaw.TaxFinance

example : ¬ inBand 0 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : ¬ inBand 1 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : ¬ inBand 17_999_999 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : ¬ inBand 18_000_000 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : inBand 18_000_001 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : inBand 40_000_000 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : ¬ inBand 40_000_001 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : inBandBool 0 = false := by decide
example : inBandBool 1 = false := by decide
example : inBandBool 17_999_999 = false := by decide
example : inBandBool 18_000_000 = false := by decide
example : inBandBool 18_000_001 = true := by decide
example : inBandBool 40_000_000 = true := by decide
example : inBandBool 40_000_001 = false := by decide
example : inBand 18_000_001 ↔ specInBand 18_000_001 := agree_in_band 18_000_001
example (a : Money) : inBand a ↔ specInBand a := agree_in_band a

end JapanTaxLaw.LocalTax37_2Band1800To4000
