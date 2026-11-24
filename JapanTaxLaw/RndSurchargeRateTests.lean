import JapanTaxLaw.RndSurchargeRate

/-!
# RndSurchargeRate tests — kernel-decided boundary examples
Pinned to law 332AC0000000026, revision 332AC0000000026_20261101_507AC0000000013, art. 10 paragraph 3 item 3.
Unit: 1/100000 of one percent; 10% = 1000000.
-/

namespace JapanTaxLaw.RndSurchargeRate

example : surchargeRate 0 = 0 := by decide
example : surchargeRate 1 = 0 := by decide
example : surchargeRate 1000000 = 0 := by decide
example : surchargeRate 1000050 = 100 := by decide
example : surchargeRate 2000000 = 1000000 := by decide
example : surchargeRate 5000000 = 1000000 := by decide

end JapanTaxLaw.RndSurchargeRate
