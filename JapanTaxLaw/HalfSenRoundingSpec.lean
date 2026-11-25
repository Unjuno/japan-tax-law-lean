import JapanTaxLaw.HalfSenRounding

/-! Independent spec: add half a yen (50 銭) then floor to a yen multiple. -/

namespace JapanTaxLaw.HalfSenRounding

def specRoundSen (sen : Nat) := (sen + 50) / 100 * 100

theorem agreeRoundSen (sen : Nat) : roundSen sen = specRoundSen sen := by
  unfold roundSen specRoundSen
  have hmod : sen % 100 < 100 := Nat.mod_lt _ (by decide)
  have hdecomp : sen = sen / 100 * 100 + sen % 100 := by
    rw [Nat.mul_comm]
    exact (Nat.div_add_mod sen 100).symm
  by_cases h : sen % 100 < 50
  · simp [h]
    have hq : (sen + 50) / 100 = sen / 100 := by omega
    rw [hq, hdecomp]
    omega
  · simp [h]
    have hq : (sen + 50) / 100 = sen / 100 + 1 := by omega
    rw [hq, hdecomp]
    omega

end JapanTaxLaw.HalfSenRounding
