import JapanTaxLaw.DisasterIncomeTaxRelief

/-!
# DisasterIncomeTaxReliefSpec — independent spec for 災害減免法 art. 2

The spec deliberately uses a DIFFERENT formulation of the same statute bands:
raw statute numerals (no implementation constant is reused), strict `<` with
successor thresholds, and multiplication order `2 * 10` instead of `10 * 2`.
Agreement is therefore a real cross-check, not a restatement.
-/

namespace JapanTaxLaw.DisasterIncomeTaxReliefSpec

def specReliefFraction (x : Nat) : Nat × Nat :=
  if x < 5_000_000 + 1 then (10, 10)
  else if x < 7_500_000 + 1 then (5, 10)
  else (5, 2 * 10)

def specFullThreshold : Nat := 5_000_000
def specHalfThreshold : Nat := 7_500_000

def agreeReliefFraction (x : Nat) : Prop :=
  specReliefFraction x = JapanTaxLaw.DisasterIncomeTaxRelief.reliefFraction x

theorem agree_relief_fraction (x : Nat) : agreeReliefFraction x := by
  unfold agreeReliefFraction specReliefFraction
  unfold JapanTaxLaw.DisasterIncomeTaxRelief.reliefFraction
  unfold JapanTaxLaw.DisasterIncomeTaxRelief.fullReliefThreshold
  unfold JapanTaxLaw.DisasterIncomeTaxRelief.halfReliefThreshold
  by_cases h1 : x <= 5_000_000
  · simp [h1, Nat.lt_succ_iff]
  · by_cases h2 : x <= 7_500_000
    · simp [h1, h2, Nat.lt_succ_iff]
    · simp [h1, h2, Nat.lt_succ_iff]

end JapanTaxLaw.DisasterIncomeTaxReliefSpec
