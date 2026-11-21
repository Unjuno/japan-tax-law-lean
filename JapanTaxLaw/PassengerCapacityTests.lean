import JapanTaxLaw.PassengerCapacity

/-!
# PassengerCapacity tests — 乗車定員 smoke checks
Decidable smoke tests, pinned to law 346CO0000000275 / revision 346CO0000000275_20230101_504CO0000000195.
境界: 9→true / 10→true / 11→false。
-/

namespace JapanTaxLaw.PassengerCapacity

example : maxPassengers = 10 := by decide
example : isPassengerCar 0 = true := by decide
example : isPassengerCar 9 = true := by decide
example : isPassengerCar 10 = true := by decide
example : isPassengerCar 11 = false := by decide
example : isPassengerCar 100 = false := by decide

end JapanTaxLaw.PassengerCapacity
