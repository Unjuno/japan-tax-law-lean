import JapanTaxLaw.BatchEffective719ef52ea1

/-! Independent spec: subtract the promulgation day and compare the offset,
    with an explicit guard for days before promulgation. The implementation
    instead adds the offset and compares; agreement is proved for all Nat
    promulgation/day values, not a sampled grid. -/
namespace JapanTaxLaw.BatchEffective719ef52ea1

def specApplies (promulgation day : Nat) : Bool :=
  if day < promulgation then false else decide (1 ≤ day - promulgation)

theorem agree_spec_impl (p day : Nat) : specApplies p day = appliesAt p day := by
  unfold specApplies appliesAt effectiveDay offset
  by_cases h : day < p
  · have hbase : ¬ p ≤ day := Nat.not_le_of_gt h
    have hnot : ¬ p + 1 ≤ day := by
      intro hle
      exact hbase (Nat.le_trans (Nat.le_add_right p 1) hle)
    rw [if_pos h, decide_eq_false_iff_not.mpr hnot]
  · have hpday : p ≤ day := Nat.le_of_not_gt h
    have hiff : (1 ≤ day - p) ↔ (p + 1 ≤ day) := by
      have hh := Nat.le_sub_iff_add_le (n := 1) (m := day) (k := p) hpday
      simpa [Nat.add_comm] using hh
    by_cases hs : 1 ≤ day - p
    · have hi : p + 1 ≤ day := hiff.mp hs
      rw [if_neg h, decide_eq_true_eq.mpr hs, decide_eq_true_eq.mpr hi]
    · have hi : ¬ p + 1 ≤ day := fun hle => hs (hiff.mpr hle)
      rw [if_neg h, decide_eq_false_iff_not.mpr hs, decide_eq_false_iff_not.mpr hi]

end JapanTaxLaw.BatchEffective719ef52ea1
