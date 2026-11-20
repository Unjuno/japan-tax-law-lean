import JapanTaxLaw.DelegationRefsAndWaivers
import JapanTaxLaw.DelegationRefsAndWaiversSpec

/-!
# DelegationRefsAndWaiversTests — 委任・参照・施行・両罰・免除
-/
namespace JapanTaxLaw.DelegationRefsAndWaiversTests

open JapanTaxLaw.DelegationRefsAndWaivers

theorem delegated_spec (c : Nat) :
    delegatedMatter c = JapanTaxLaw.DelegationRefsAndWaiversSpec.delegatedSpec c := by rfl

theorem ref_spec (t : Nat) :
    resolveFragmentRef t = JapanTaxLaw.DelegationRefsAndWaiversSpec.refSpec t := by rfl

theorem applies_spec (d t : Nat) :
    appliesFrom d t = true ↔ JapanTaxLaw.DelegationRefsAndWaiversSpec.appliesFromSpec d t := by
  simp [appliesFrom, JapanTaxLaw.DelegationRefsAndWaiversSpec.appliesFromSpec]

theorem dual_spec (a c : Nat) :
    bothPunished a c ↔ JapanTaxLaw.DelegationRefsAndWaiversSpec.dualSpec a c := by rfl

theorem doc_spec (r : Bool) :
    documentRequired r = JapanTaxLaw.DelegationRefsAndWaiversSpec.documentSpec r := by rfl

example (c : Nat) : delegatedMatter c = c := delegated_matter_identity c
example (t : Nat) : resolveFragmentRef t = t := fragment_ref_identity t
example : RefKind.sameLaw ≠ RefKind.ministryRule := ref_kinds_distinct
example (t : Nat) : appliesFrom t t = true := applies_at_trigger t
example (d t : Nat) (h : t <= d) : appliesFrom d t = true := applies_after d t h
example (d t : Nat) (h : d < t) : appliesFrom d t = false := applies_before d t h
example (a c : Nat) (h : bothPunished a c) : a > 0 := actor_punished a c h
example (a c : Nat) (h : bothPunished a c) : c > 0 := corp_punished a c h
example (a c : Nat) (ha : a > 0) (hc : c > 0) : bothPunished a c := both_of_pos a c ha hc
example (a a' c : Nat) (h : bothPunished a c) : bothPunished a' c ↔ a' > 0 := corp_independent a a' c h
example : documentRequired true = false := waived_if_reason
example : documentRequired false = true := required_without_reason
example (r : Bool) : documentRequired r = false ↔ r = true := waiver_exclusive r

end JapanTaxLaw.DelegationRefsAndWaiversTests
