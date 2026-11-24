import JapanTaxLaw.LocalTax37_2Band330To695Spec

/-
# LocalTax37_2Band330To695Tests — kernel-decided boundary checks, 地方税法 第三十七条の二(11)
-/

namespace JapanTaxLaw.LocalTax37_2Band330To695

open JapanTaxLaw.TaxFinance

example : ¬ inBand 0 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : ¬ inBand 1 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : ¬ inBand 3_299_999 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : ¬ inBand 3_300_000 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : inBand 3_300_001 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : inBand 6_950_000 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : ¬ inBand 6_950_001 := by unfold inBand lowerExclusiveYen upperInclusiveYen; decide
example : inBandBool 0 = false := by decide
example : inBandBool 1 = false := by decide
example : inBandBool 3_299_999 = false := by decide
example : inBandBool 3_300_000 = false := by decide
example : inBandBool 3_300_001 = true := by decide
example : inBandBool 6_950_000 = true := by decide
example : inBandBool 6_950_001 = false := by decide
example : inBand 3_300_001 ↔ specInBand 3_300_001 := agree_in_band 3_300_001
example (a : Money) : inBand a ↔ specInBand a := agree_in_band a

end JapanTaxLaw.LocalTax37_2Band330To695
