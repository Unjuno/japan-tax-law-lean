import JapanTaxLaw.DefaultBranches
import JapanTaxLaw.DefaultBranchesSpec

/-!
# DefaultBranchesTests — 補集合・境界・変形同一性
-/
namespace JapanTaxLaw.DefaultBranchesTests

open JapanTaxLaw.DefaultBranches

theorem spec_agree (n c : Nat) :
    isOtherCase n c = true ↔ JapanTaxLaw.DefaultBranchesSpec.otherSpec n c := by
  simp [isOtherCase, JapanTaxLaw.DefaultBranchesSpec.otherSpec]

example : isOtherCase 3 2 = false := by decide
example : isOtherCase 3 3 = true := by decide
example : isOtherCase 3 4 = true := by decide
example (n c : Nat) (h : c < n) : isOtherCase n c = false := listed_case_not_other n c h
example (n c : Nat) (h : n <= c) : isOtherCase n c = true := other_case_not_listed n c h
example (n c : Nat) : ¬ (c < n ∧ isOtherCase n c = true) := listed_other_exclusive n c
example (n c : Nat) : c < n ∨ isOtherCase n c = true := listed_other_exhaustive n c
example (n : Nat) : isOtherCase n n = true := boundary_at_n n
example (n c : Nat) : VZenGo.other n c = VRo.other n c := (all_variants_share_structure n c).2.2

end JapanTaxLaw.DefaultBranchesTests
