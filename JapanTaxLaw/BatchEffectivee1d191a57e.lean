import JapanTaxLaw.TaxFinance

/-! Generated batch template for a simple commencement norm.
    `offset` is the statutory day offset from promulgation. The promulgation
    day is caller-established (Nat) and is NOT resolved. No calendar/era
    arithmetic is modelled. -/
namespace JapanTaxLaw.BatchEffectivee1d191a57e

/-- Statutory day offset from promulgation to the effective day. -/
def offset : Nat := 1

/-- Effective day = promulgation day + statutory offset. -/
def effectiveDay (promulgation : Nat) : Nat := promulgation + offset

/-- The norm applies from the effective day onward. -/
def appliesAt (promulgation day : Nat) : Bool := decide (effectiveDay promulgation ≤ day)

theorem applies_on_effective_day (p : Nat) : appliesAt p (p + 1) = true := by
  unfold appliesAt effectiveDay offset
  exact decide_eq_true_eq.mpr (Nat.le_refl (p + 1))

theorem shift_invariant (p k : Nat) : appliesAt p (p + k) = decide (1 ≤ k) := by
  unfold appliesAt effectiveDay offset
  by_cases h : 1 ≤ k
  · have h2 : p + 1 ≤ p + k :=
      (Nat.add_le_add_iff_left (n := p) (m := 1) (k := k)).mpr h
    rw [decide_eq_true_eq.mpr h2, decide_eq_true_eq.mpr h]
  · have h2 : ¬ p + 1 ≤ p + k := fun hle =>
      h ((Nat.add_le_add_iff_left (n := p) (m := 1) (k := k)).mp hle)
    rw [decide_eq_false_iff_not.mpr h2, decide_eq_false_iff_not.mpr h]

end JapanTaxLaw.BatchEffectivee1d191a57e
