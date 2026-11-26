import JapanTaxLaw.LocalTaxInsuranceBusinessBase24PercentSpec

/-!
# LocalTaxInsuranceBusinessBase24Percent tests — kernel-decided boundary checks

Pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
境界: 23/24/25 と 99/100/101（百分の二十四、分母100）。
-/

namespace JapanTaxLaw.LocalTaxInsuranceBusinessBase24Percent

example : businessBase 0 = 0 := by decide
example : businessBase 1 = 0 := by decide
example : businessBase 23 = 5 := by decide
example : businessBase 24 = 5 := by decide
example : businessBase 25 = 6 := by decide
example : businessBase 99 = 23 := by decide
example : businessBase 100 = 24 := by decide
example : businessBase 101 = 24 := by decide
example : specBase 25 = businessBase 25 := by decide
example : specBase 100 = businessBase 100 := by decide

end JapanTaxLaw.LocalTaxInsuranceBusinessBase24Percent
