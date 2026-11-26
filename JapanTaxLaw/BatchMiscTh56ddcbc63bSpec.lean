import JapanTaxLaw.BatchMiscTh56ddcbc63b

/-! Independent two-branch spec; agreement is universal over every Nat. -/
namespace JapanTaxLaw.BatchMiscTh56ddcbc63b

def specApplies (x : Nat) : Bool :=
  if limit ≤ x then false else true

theorem agree_spec_impl (x : Nat) : specApplies x = applies x := by
  unfold specApplies applies
  by_cases h : limit ≤ x
  · rw [if_pos h]
    have hnot : ¬ (x < limit) := by
      exact Nat.not_lt_of_ge h
    exact (decide_eq_false_iff_not.mpr hnot).symm
  · rw [if_neg h]
    have hyes : x < limit := by
      exact Nat.lt_of_not_ge h
    exact (decide_eq_true_eq.mpr hyes).symm

end JapanTaxLaw.BatchMiscTh56ddcbc63b
