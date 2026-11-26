import JapanTaxLaw.TaxFinance

/-! Generated template for a calculated commencement norm (fixed).
    The delegated day / promulgation day is caller-established and NOT resolved.
    No calendar arithmetic is modelled. -/
namespace JapanTaxLaw.BatchCommencefb44857582

/-- Abstract offset (months recorded from the text). -/
def offset : Nat := 6

def effectiveDay (promulgation : Nat) : Nat := promulgation + offset

def appliesAt (promulgation day : Nat) : Bool :=
  decide (effectiveDay promulgation ≤ day)

theorem applies_on_effective_day (p : Nat) : appliesAt p (p + 6) = true := by
  unfold appliesAt effectiveDay offset
  exact decide_eq_true_eq.mpr (Nat.le_refl (p + 6))

theorem shift_invariant (p k : Nat) : appliesAt p (p + k) = decide (6 ≤ k) := by
  unfold appliesAt effectiveDay offset
  by_cases h : 6 ≤ k
  · have h2 : p + 6 ≤ p + k :=
      (Nat.add_le_add_iff_left (n := p) (m := 6) (k := k)).mpr h
    rw [decide_eq_true_eq.mpr h2, decide_eq_true_eq.mpr h]
  · have h2 : ¬ p + 6 ≤ p + k := fun hle =>
      h ((Nat.add_le_add_iff_left (n := p) (m := 6) (k := k)).mp hle)
    rw [decide_eq_false_iff_not.mpr h2, decide_eq_false_iff_not.mpr h]
end JapanTaxLaw.BatchCommencefb44857582
