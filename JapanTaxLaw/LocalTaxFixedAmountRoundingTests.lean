import JapanTaxLaw.LocalTaxFixedAmountRounding

/-!
# LocalTaxFixedAmountRounding tests — 確定金額端数切捨て smoke checks
Decidable smoke tests, pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
百円未満切捨て。
-/

namespace JapanTaxLaw.LocalTaxFixedAmountRounding

example : roundDownToHundred 99 = 0 := by decide
example : roundDownToHundred 100 = 100 := by decide
example : roundDownToHundred 12345 = 12300 := by decide

end JapanTaxLaw.LocalTaxFixedAmountRounding
