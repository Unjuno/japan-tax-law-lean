import JapanTaxLaw.PassengerCapacity

/-!
# PassengerCapacity spec — 乗車定員 10 人以下 の独立整数定式
Sources (pinned): law 346CO0000000275, revision 346CO0000000275_20230101_504CO0000000195.
Independent restatement: 定員 <= 10（境界含む）。
-/

namespace JapanTaxLaw.PassengerCapacity

def specPassenger (c : Nat) : Bool := c <= 10

example : specPassenger 10 = true := by decide
example : specPassenger 11 = false := by decide

def agreePassengerCapacity : Bool :=
  [0, 1, 9, 10, 11, 100].all fun c => isPassengerCar c == specPassenger c

example : agreePassengerCapacity = true := by decide

end JapanTaxLaw.PassengerCapacity
