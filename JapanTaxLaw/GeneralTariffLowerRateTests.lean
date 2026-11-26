import JapanTaxLaw.GeneralTariffLowerRate

/-!
# GeneralTariffLowerRate tests — kernel-decided boundary examples
Pinned to law 414CO0000000262, revision 414CO0000000262_20110401_423CO0000000088, art. 4(1).
Unit: common integer rate scale.
-/

namespace JapanTaxLaw.GeneralTariffLowerRate

example : generalRate 0 0 = 0 := by decide
example : generalRate 1 2 = 1 := by decide
example : generalRate 2 1 = 1 := by decide
example : generalRate 100 50 = 50 := by decide
example : generalRate 50 100 = 50 := by decide
example : generalRate 100 100 = 100 := by decide

end JapanTaxLaw.GeneralTariffLowerRate
