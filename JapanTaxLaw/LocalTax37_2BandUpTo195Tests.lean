import JapanTaxLaw.LocalTax37_2BandUpTo195Spec

/-
# LocalTax37_2BandUpTo195Tests — kernel-decided boundary checks, 地方税法 第三十七条の二(11)
-/

namespace JapanTaxLaw.LocalTax37_2BandUpTo195

open JapanTaxLaw.TaxFinance

example : inBand 0 := by unfold inBand upperInclusiveYen; decide
example : inBand 1 := by unfold inBand upperInclusiveYen; decide
example : inBand 1_949_999 := by unfold inBand upperInclusiveYen; decide
example : inBand 1_950_000 := by unfold inBand upperInclusiveYen; decide
example : ¬ inBand 1_950_001 := by unfold inBand upperInclusiveYen; decide
example : inBandBool 0 = true := by decide
example : inBandBool 1 = true := by decide
example : inBandBool 1_949_999 = true := by decide
example : inBandBool 1_950_000 = true := by decide
example : inBandBool 1_950_001 = false := by decide
example : inBand 1_950_000 ↔ specInBand 1_950_000 := agree_in_band 1_950_000
example (a : Money) : inBand a ↔ specInBand a := agree_in_band a

end JapanTaxLaw.LocalTax37_2BandUpTo195
