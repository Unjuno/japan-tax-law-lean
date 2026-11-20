import JapanTaxLaw.DualSanctionsAndDelegation
import JapanTaxLaw.DualSanctionsAndDelegationSpec

/-!
# DualSanctionsAndDelegationTests — 両罰の連言・委任同一性
-/
namespace JapanTaxLaw.DualSanctionsAndDelegationTests

open JapanTaxLaw.DualSanctionsAndDelegation

theorem dual_spec (a c : Nat) :
    bothSanctioned a c ↔ JapanTaxLaw.DualSanctionsAndDelegationSpec.dualSanctionSpec a c := by rfl

theorem deleg_spec (c : Nat) :
    delegatedContent c = JapanTaxLaw.DualSanctionsAndDelegationSpec.delegationSpec c := by rfl

example : bothSanctioned 500000 500000 := both_of_positives 500000 500000 (by decide) (by decide)
example : ¬ bothSanctioned 0 500000 := by intro h; unfold bothSanctioned at h; omega
example : ¬ bothSanctioned 500000 0 := by intro h; unfold bothSanctioned at h; omega
example (a c : Nat) (h : bothSanctioned a c) : a > 0 := actor_sanctioned a c h
example (a c : Nat) (h : bothSanctioned a c) : c > 0 := corp_sanctioned a c h
example (a c : Nat) (ha : a > 0) (hc : c > 0) : bothSanctioned a c := both_of_positives a c ha hc
example (a c c' : Nat) (h : bothSanctioned a c) : bothSanctioned a c' ↔ c' > 0 :=
  actor_independent_of_corp a c c' h
example (a a' c : Nat) (h : bothSanctioned a c) : bothSanctioned a' c ↔ a' > 0 :=
  corp_independent_of_actor a a' c h
example (c : Nat) : PenaltyInclusive.delegate c = NecessaryMatters.delegate c :=
  delegation_variants_identical c

end JapanTaxLaw.DualSanctionsAndDelegationTests
