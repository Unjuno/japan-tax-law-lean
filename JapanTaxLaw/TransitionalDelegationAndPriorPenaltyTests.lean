import JapanTaxLaw.TransitionalDelegationAndPriorPenalty
import JapanTaxLaw.TransitionalDelegationAndPriorPenaltySpec

/-!
# TransitionalDelegationAndPriorPenaltyTests
-/
namespace JapanTaxLaw.TransitionalDelegationAndPriorPenaltyTests

open JapanTaxLaw.TransitionalDelegationAndPriorPenalty

theorem deleg_spec (c : Nat) :
    delegTransitional c = JapanTaxLaw.TransitionalDelegationAndPriorPenaltySpec.delegationSpec c := by
  rfl

theorem penalty_spec (d e : Nat) :
    applicablePenaltyLaw d e =
      JapanTaxLaw.TransitionalDelegationAndPriorPenaltySpec.penaltyEraSpec d e := by
  rfl

example : applicablePenaltyLaw 99 100 = 0 := by decide
example : applicablePenaltyLaw 100 100 = 1 := by decide
example : applicablePenaltyLaw 101 100 = 1 := by decide
example (d e : Nat) (h : d < e) : applicablePenaltyLaw d e = 0 := before_enforcement d e h
example (d e : Nat) (h : e <= d) : applicablePenaltyLaw d e = 1 := at_or_after_enforcement d e h
example (d e : Nat) : ¬ (applicablePenaltyLaw d e = 0 ∧ applicablePenaltyLaw d e = 1) := old_new_exclusive d e
example (d e : Nat) : applicablePenaltyLaw d e = 0 ∨ applicablePenaltyLaw d e = 1 := old_new_exhaustive d e
example (c : Nat) : V1.delegate c = V4.delegate c := (all_delegation_variants c).2.2

end JapanTaxLaw.TransitionalDelegationAndPriorPenaltyTests
