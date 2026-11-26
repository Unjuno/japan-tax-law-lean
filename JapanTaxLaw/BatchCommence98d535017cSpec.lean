import JapanTaxLaw.BatchCommence98d535017c

/-! Independent spec; agreement is universal over the abstract Nat domain. -/
namespace JapanTaxLaw.BatchCommence98d535017c

def specApplies (promulgation day : Nat) : Bool :=
  if day < promulgation then false else decide (6 ≤ day - promulgation)

theorem agree_spec_impl (p day : Nat) : specApplies p day = appliesAt p day := by
  unfold specApplies appliesAt effectiveDay offset
  by_cases h : day < p
  · have hbase : ¬ p ≤ day := Nat.not_le_of_gt h
    have hnot : ¬ p + 6 ≤ day := by
      intro hle
      exact hbase (Nat.le_trans (Nat.le_add_right p 6) hle)
    rw [if_pos h, decide_eq_false_iff_not.mpr hnot]
  · have hpday : p ≤ day := Nat.le_of_not_gt h
    have hiff : (6 ≤ day - p) ↔ (p + 6 ≤ day) := by
      have hh := Nat.le_sub_iff_add_le (n := 6) (m := day) (k := p) hpday
      simpa [Nat.add_comm] using hh
    by_cases hs : 6 ≤ day - p
    · have hi : p + 6 ≤ day := hiff.mp hs
      rw [if_neg h, decide_eq_true_eq.mpr hs, decide_eq_true_eq.mpr hi]
    · have hi : ¬ p + 6 ≤ day := fun hle => hs (hiff.mpr hle)
      rw [if_neg h, decide_eq_false_iff_not.mpr hs, decide_eq_false_iff_not.mpr hi]
end JapanTaxLaw.BatchCommence98d535017c
