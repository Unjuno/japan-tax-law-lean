import JapanTaxLaw.BatchMiscTh44d95d7618

/-! Independent two-branch spec; agreement is universal over every Nat. -/
namespace JapanTaxLaw.BatchMiscTh44d95d7618

def specApplies (x : Nat) : Bool :=
  if limit < x then false else true

theorem agree_spec_impl (x : Nat) : specApplies x = applies x := by
  unfold specApplies applies
  by_cases h : limit < x
  · rw [if_pos h]
    have hnot : ¬ (x ≤ limit) := by
      exact Nat.not_le_of_gt h
    exact (decide_eq_false_iff_not.mpr hnot).symm
  · rw [if_neg h]
    have hyes : x ≤ limit := by
      exact Nat.le_of_not_gt h
    exact (decide_eq_true_eq.mpr hyes).symm

end JapanTaxLaw.BatchMiscTh44d95d7618
