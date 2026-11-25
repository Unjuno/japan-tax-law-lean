import JapanTaxLaw.FloorRoundingMinimum

/-!
# FloorRoundingMinimumSpec — 独立仕様（商×閾値定式）

The implementation uses remainder subtraction plus an `amount < threshold`
branch. This independent spec uses quotient multiplication instead of
remainder subtraction, with the same explicit minimum branch. Universal
theorems prove agreement for ALL Nat at every nonzero pinned threshold,
plus monotonicity.
-/

namespace JapanTaxLaw.FloorRoundingMinimum

theorem floorAt_eq_quotient (amount threshold : Nat) (ht : threshold ≠ 0) :
    floorAt amount threshold = amount / threshold * threshold := by
  unfold floorAt
  simp [ht]
  have hdec := Nat.div_add_mod amount threshold
  have hle : amount % threshold ≤ amount := Nat.mod_le amount threshold
  have hgoal : amount = amount / threshold * threshold + amount % threshold := by
    rw [Nat.mul_comm]
    exact hdec.symm
  omega

def specFloorAt (amount threshold : Nat) := amount / threshold * threshold

theorem floorAt_agrees (amount threshold : Nat) (ht : threshold ≠ 0) :
    floorAt amount threshold = specFloorAt amount threshold :=
  floorAt_eq_quotient amount threshold ht

def specFloorOrMinimum (amount threshold minimum : Nat) :=
  if amount < threshold then minimum else amount / threshold * threshold

theorem floorOrMinimum_agrees (amount threshold minimum : Nat) (ht : threshold ≠ 0) :
    floorOrMinimum amount threshold minimum = specFloorOrMinimum amount threshold minimum := by
  unfold floorOrMinimum specFloorOrMinimum
  by_cases h : amount < threshold
  · simp [h]
  · simp [h, floorAt_eq_quotient amount threshold ht]

theorem floorAt_monotone (threshold : Nat) :
    ∀ a b, a ≤ b → floorAt a threshold ≤ floorAt b threshold := by
  intro a b h
  by_cases ht : threshold = 0
  · simpa [floorAt, ht] using h
  · rw [floorAt_eq_quotient a threshold ht, floorAt_eq_quotient b threshold ht]
    exact Nat.mul_le_mul_right threshold (Nat.div_le_div_right h)

end JapanTaxLaw.FloorRoundingMinimum
