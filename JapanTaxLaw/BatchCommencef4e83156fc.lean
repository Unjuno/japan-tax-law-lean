import JapanTaxLaw.TaxFinance

/-! Generated template for a calculated commencement norm (fixed).
    The delegated day / promulgation day is caller-established and NOT resolved.
    No calendar arithmetic is modelled. -/
namespace JapanTaxLaw.BatchCommencef4e83156fc

/-- Abstract offset (months recorded from the text). -/
def offset : Nat := 3

def effectiveDay (promulgation : Nat) : Nat := promulgation + offset

def appliesAt (promulgation day : Nat) : Bool :=
  decide (effectiveDay promulgation ≤ day)

theorem applies_on_effective_day (p : Nat) : appliesAt p (p + 3) = true := by
  unfold appliesAt effectiveDay offset
  exact decide_eq_true_eq.mpr (Nat.le_refl (p + 3))

theorem shift_invariant (p k : Nat) : appliesAt p (p + k) = decide (3 ≤ k) := by
  unfold appliesAt effectiveDay offset
  by_cases h : 3 ≤ k
  · have h2 : p + 3 ≤ p + k :=
      (Nat.add_le_add_iff_left (n := p) (m := 3) (k := k)).mpr h
    rw [decide_eq_true_eq.mpr h2, decide_eq_true_eq.mpr h]
  · have h2 : ¬ p + 3 ≤ p + k := fun hle =>
      h ((Nat.add_le_add_iff_left (n := p) (m := 3) (k := k)).mp hle)
    rw [decide_eq_false_iff_not.mpr h2, decide_eq_false_iff_not.mpr h]
end JapanTaxLaw.BatchCommencef4e83156fc
