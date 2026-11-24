import JapanTaxLaw.AircraftFuelGrantTaxOrderEnforcementDate

/-!
# AircraftFuelGrantTaxOrderEnforcementDate tests — 施行日 smoke checks
Decidable smoke tests, pinned to law 347CO0000000167 / revision 347CO0000000167_20140312_426CO0000000059.
昭和54年=1979、施行日 1979-04-01。
-/

namespace JapanTaxLaw.AircraftFuelGrantTaxOrderEnforcementDate

example : showaToSeireki 54 = 1979 := by decide
example : enforcementDate = (1979, 4, 1) := by decide
example : inForce (1979, 3, 31) = false := by decide
example : inForce (1979, 4, 1) = true := by decide

end JapanTaxLaw.AircraftFuelGrantTaxOrderEnforcementDate
