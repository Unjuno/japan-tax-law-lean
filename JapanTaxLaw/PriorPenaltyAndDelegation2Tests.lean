import JapanTaxLaw.PriorPenaltyAndDelegation2
import JapanTaxLaw.PriorPenaltyAndDelegation2Spec

/-!
# PriorPenaltyAndDelegation2Tests — 従前例・委任・枝番号
-/
namespace JapanTaxLaw.PriorPenaltyAndDelegation2Tests

open JapanTaxLaw.PriorPenaltyAndDelegation2

theorem old_penalty_spec (a e : Nat) :
    oldPenaltyApplies a e = true ↔ JapanTaxLaw.PriorPenaltyAndDelegation2Spec.oldPenaltySpec a e := by
  simp [oldPenaltyApplies, JapanTaxLaw.PriorPenaltyAndDelegation2Spec.oldPenaltySpec]

theorem term_spec (t : Nat) :
    termLookup t = JapanTaxLaw.PriorPenaltyAndDelegation2Spec.termSpec t := by rfl

theorem supplementary_spec (c : Nat) :
    supplementaryDelegation c = JapanTaxLaw.PriorPenaltyAndDelegation2Spec.supplementarySpec c := by rfl

example (a e : Nat) (h : a < e) : oldPenaltyApplies a e = true := old_penalty_before a e h
example (a e : Nat) (h : e <= a) : oldPenaltyApplies a e = false := new_penalty_from_enforcement a e h
example (t : Nat) : termLookup t = t := term_lookup_identity t
example (c : Nat) : supplementaryDelegation c = c := supplementary_identity c
example : parseSubItem "二十一の二" = some (21, 2) := subitem_21_2

end JapanTaxLaw.PriorPenaltyAndDelegation2Tests
