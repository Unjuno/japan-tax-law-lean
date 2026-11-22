import JapanTaxLaw.ReliefAndInterestNorms
import JapanTaxLaw.ReliefAndInterestNormsSpec

/-!
# ReliefAndInterestNormsTests — 還付加算金・軽減免除・無税
-/
namespace JapanTaxLaw.ReliefAndInterestNormsTests

open JapanTaxLaw.ReliefAndInterestNorms

theorem later_spec (a b : Nat) :
    laterOf a b = JapanTaxLaw.ReliefAndInterestNormsSpec.laterSpec a b := by rfl

theorem interest_spec (p r y : Nat) :
    refundInterest p r y = JapanTaxLaw.ReliefAndInterestNormsSpec.interestSpec p r y := by rfl

theorem recover_spec (r e : Bool) :
    recoverRelief r e = JapanTaxLaw.ReliefAndInterestNormsSpec.recoverSpec r e := by rfl

example (a b : Nat) (h : a <= b) : laterOf a b = b := later_of_left a b h
example (a b : Nat) (h : b < a) : laterOf a b = a := later_of_right a b h
example (p r : Nat) : refundInterest p r 0 = 0 := interest_zero_years p r
example : recoverRelief true false = true := recover_when_reduced
example : recoverRelief false true = true := recover_when_exempted
example : recoverRelief false false = false := no_recovery
example (a : Nat) : zeroRate a = 0 := zero_rate a
example : reliefDeclared = true := relief_is_declaration

end JapanTaxLaw.ReliefAndInterestNormsTests
