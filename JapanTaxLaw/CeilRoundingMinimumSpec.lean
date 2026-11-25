import JapanTaxLaw.CeilRoundingMinimum

/-! Independent spec: quotient × threshold plus one threshold when a remainder exists. -/

namespace JapanTaxLaw.CeilRoundingMinimum

def specCeilOrMinimum (amount threshold : Nat) : Nat :=
  if amount < threshold then threshold
  else amount / threshold * threshold + (if amount % threshold = 0 then 0 else threshold)

theorem agreeCeilOrMinimum (amount threshold : Nat) (ht : 0 < threshold) :
    ceilOrMinimum amount threshold = specCeilOrMinimum amount threshold := by
  unfold ceilOrMinimum specCeilOrMinimum ceilAt
  have htn : threshold ≠ 0 := by omega
  by_cases hlt : amount < threshold
  · simp [hlt]
  · simp [hlt]
    have hdecomp : amount = amount / threshold * threshold + amount % threshold := by
      rw [Nat.mul_comm]
      exact (Nat.div_add_mod amount threshold).symm
    have hmod : amount % threshold < threshold := Nat.mod_lt _ ht
    by_cases hm : amount % threshold = 0
    · simp [hm, htn]
      omega
    · simp [hm, htn]
      omega

end JapanTaxLaw.CeilRoundingMinimum
