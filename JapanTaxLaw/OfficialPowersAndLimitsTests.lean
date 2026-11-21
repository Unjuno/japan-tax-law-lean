import JapanTaxLaw.OfficialPowersAndLimits
import JapanTaxLaw.OfficialPowersAndLimitsSpec

/-!
# OfficialPowersAndLimitsTests — 公権限・限度額
-/
namespace JapanTaxLaw.OfficialPowersAndLimitsTests

open JapanTaxLaw.OfficialPowersAndLimits

theorem power_spec (n : Bool) :
    discretionaryPower n = JapanTaxLaw.OfficialPowersAndLimitsSpec.powerSpec n := by rfl

theorem commission_spec (d : Bool) :
    commissionReady d = JapanTaxLaw.OfficialPowersAndLimitsSpec.commissionSpec d := by rfl

theorem cap_spec (a l : Nat) :
    deductionCap a l = JapanTaxLaw.OfficialPowersAndLimitsSpec.capSpec a l := by rfl

example : discretionaryPower true = true := power_when_needed
example : discretionaryPower false = false := no_power_when_unneeded
example : commissionReady true = true := commission_with_docs
example : commissionReady false = false := commission_without_docs
example (a l : Nat) (h : a <= l) : deductionCap a l = a := cap_under a l h
example (a l : Nat) (h : l < a) : deductionCap a l = l := cap_over a l h
example : officialPowerDeclared = true := power_is_declaration

end JapanTaxLaw.OfficialPowersAndLimitsTests
