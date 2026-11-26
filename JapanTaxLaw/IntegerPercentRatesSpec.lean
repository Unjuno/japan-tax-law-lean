import JapanTaxLaw.IntegerPercentRates

/-! Independent spec: the rate-first product, plus fraction laws (identity,
    complement, scaling, monotonicity) proved for the numerator over 100. -/

namespace JapanTaxLaw.IntegerPercentRates

def specNumerator (amount p : Nat) : Nat := p * amount

theorem numerator_agrees (amount p : Nat) :
    percentNumerator amount p = specNumerator amount p := by
  unfold percentNumerator specNumerator
  exact Nat.mul_comm amount p

theorem numerator_hundred (amount : Nat) :
    percentNumerator amount 100 = 100 * amount := by
  unfold percentNumerator
  exact Nat.mul_comm amount 100

theorem numerator_complement (amount p : Nat) (hp : p ≤ 100) :
    percentNumerator amount p + percentNumerator amount (100 - p) = 100 * amount := by
  unfold percentNumerator
  rw [Nat.mul_sub_left_distrib]
  have hle : amount * p ≤ amount * 100 := Nat.mul_le_mul_left amount hp
  omega

theorem numerator_scaling (amount p : Nat) :
    percentNumerator (amount * 100) p = 100 * percentNumerator amount p := by
  unfold percentNumerator
  simp [Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm]

theorem numerator_monotone (amount p q : Nat) (hpq : p ≤ q) :
    percentNumerator amount p ≤ percentNumerator amount q := by
  unfold percentNumerator
  exact Nat.mul_le_mul_left amount hpq

end JapanTaxLaw.IntegerPercentRates
