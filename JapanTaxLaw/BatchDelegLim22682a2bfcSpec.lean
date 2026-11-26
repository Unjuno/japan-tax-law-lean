import JapanTaxLaw.BatchDelegLim22682a2bfc

/-! Independent branch-form spec; universal agreement over Nat x Nat. -/
namespace JapanTaxLaw.BatchDelegLim22682a2bfc

def specApplies (limit x : Nat) : Bool :=
  if limit < x then false else true

theorem agree_spec_impl (limit x : Nat) : specApplies limit x = applies limit x := by
  unfold specApplies applies
  by_cases h : limit < x
  · rw [if_pos h]
    exact (decide_eq_false_iff_not.mpr (Nat.not_le_of_gt h)).symm
  · rw [if_neg h]
    exact (decide_eq_true_eq.mpr (Nat.le_of_not_gt h)).symm

end JapanTaxLaw.BatchDelegLim22682a2bfc
