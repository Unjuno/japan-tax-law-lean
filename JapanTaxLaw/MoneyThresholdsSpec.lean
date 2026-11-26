import JapanTaxLaw.MoneyThresholds

/-! Independent specs: compare via Nat.min / Nat subtraction, not the direct order test. -/

namespace JapanTaxLaw.MoneyThresholds

theorem min_eq_iff_le (amount threshold : Nat) :
    min threshold amount = threshold ↔ threshold ≤ amount := by
  constructor
  · intro h
    by_cases hl : threshold ≤ amount
    · exact hl
    · have hm : min threshold amount = amount := Nat.min_eq_right (by omega)
      rw [hm] at h
      omega
  · intro h
    exact Nat.min_eq_left h

def specAtLeast (amount threshold : Nat) : Bool := decide (min threshold amount = threshold)
def specExceeds (amount threshold : Nat) : Bool := decide (0 < amount - threshold)

theorem atLeast_agrees (amount threshold : Nat) :
    atLeast amount threshold = specAtLeast amount threshold := by
  unfold atLeast specAtLeast
  simp [min_eq_iff_le]

theorem exceeds_agrees (amount threshold : Nat) :
    exceeds amount threshold = specExceeds amount threshold := by
  unfold exceeds specExceeds
  by_cases h : threshold < amount
  · have hp : 0 < amount - threshold := Nat.sub_pos_of_lt h
    simp [h, hp]
  · have hz : amount - threshold = 0 := Nat.sub_eq_zero_of_le (by omega)
    simp [h, hz]

end JapanTaxLaw.MoneyThresholds
