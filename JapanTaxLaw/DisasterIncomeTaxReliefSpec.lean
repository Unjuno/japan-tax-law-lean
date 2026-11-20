import JapanTaxLaw.DisasterIncomeTaxRelief

/-!
# DisasterIncomeTaxReliefSpec — independent spec for 災害減免法 art. 2

The spec deliberately uses a DIFFERENT formulation of the same statute bands
(strict `<` with successor thresholds, and multiplication order `2 * 10`
instead of `10 * 2`) so that agreement is a real cross-check rather than a
restatement of the implementation.
-/

namespace JapanTaxLaw.DisasterIncomeTaxReliefSpec

open JapanTaxLaw.DisasterIncomeTaxRelief

def specReliefFraction (x : Nat) : Nat × Nat :=
  if x < fullReliefThreshold + 1 then (10, 10)
  else if x < halfReliefThreshold + 1 then (5, 10)
  else (5, 2 * 10)

def agreeReliefFraction (x : Nat) : Prop :=
  specReliefFraction x = reliefFraction x

theorem agree_relief_fraction (x : Nat) : agreeReliefFraction x := by
  unfold agreeReliefFraction specReliefFraction reliefFraction
  unfold fullReliefThreshold halfReliefThreshold
  by_cases h1 : x <= 5_000_000
  · simp [h1, Nat.lt_succ_iff]
  · by_cases h2 : x <= 7_500_000
    · simp [h1, h2, Nat.lt_succ_iff]
    · simp [h1, h2, Nat.lt_succ_iff]

end JapanTaxLaw.DisasterIncomeTaxReliefSpec
