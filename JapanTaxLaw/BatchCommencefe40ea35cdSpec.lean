import JapanTaxLaw.BatchCommencefe40ea35cd

/-! Independent spec; agreement is universal over the abstract Nat domain. -/
namespace JapanTaxLaw.BatchCommencefe40ea35cd

def specWithin (d : Nat) : Bool :=
  if periodLimit < d then false else true

theorem agree_spec_impl (d : Nat) : specWithin d = withinLimit d := by
  unfold specWithin withinLimit
  by_cases h : periodLimit < d
  · rw [if_pos h]
    exact (decide_eq_false_iff_not.mpr (Nat.not_le_of_gt h)).symm
  · rw [if_neg h]
    exact (decide_eq_true_eq.mpr (Nat.le_of_not_gt h)).symm
end JapanTaxLaw.BatchCommencefe40ea35cd
