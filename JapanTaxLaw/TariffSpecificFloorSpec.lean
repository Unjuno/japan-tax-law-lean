import JapanTaxLaw.TariffSpecificFloor

/-!
# TariffSpecificFloorSpec — 独立仕様（max 定式）と全称対応証明

The implementation chooses between the two rates via a comparison of
`price * num` and `floor * den`. This independent spec computes both amounts
and takes the maximum. Universal agreement is proved for ALL Nat inputs with
positive `den`, using `Nat.div_lt_iff_lt_mul` / `Nat.le_div_iff_mul_le` and
`Nat.max_eq_left/right`.
-/

namespace JapanTaxLaw.TariffSpecificFloor

def specTariffDuty (price kg num den floor : Nat) : Nat :=
  max (price * kg * num / den) (kg * floor)

theorem tariffDuty_agrees (price kg num den floor : Nat) (hd : 0 < den) :
    tariffDuty price kg num den floor = specTariffDuty price kg num den floor := by
  unfold tariffDuty specTariffDuty
  by_cases h : price * num < floor * den
  · simp [h]
    by_cases hkg : kg = 0
    · simp [hkg]
    · have hkgpos : 0 < kg := by omega
      have hmul : (price * num) * kg < (floor * den) * kg :=
        Nat.mul_lt_mul_of_pos_right h hkgpos
      have hmul' : price * kg * num < floor * kg * den := by
        rw [show price * kg * num = price * num * kg by ac_rfl,
            show floor * kg * den = floor * den * kg by ac_rfl]
        exact hmul
      have hrhs : (floor * kg + 1) * den = floor * kg * den + den := by
        rw [Nat.add_mul, Nat.one_mul]
      have hlt : price * kg * num < floor * kg * den + den := by omega
      have hdiv : price * kg * num / den < floor * kg + 1 :=
        (Nat.div_lt_iff_lt_mul hd).mpr (by rw [hrhs]; exact hlt)
      have hle : price * kg * num / den ≤ kg * floor := by
        rw [Nat.mul_comm kg floor]
        omega
      rw [Nat.max_eq_right hle]
  · simp [h]
    have hge : floor * den ≤ price * num := by omega
    have hmul : (floor * den) * kg ≤ (price * num) * kg := Nat.mul_le_mul_right kg hge
    have hle' : floor * kg * den ≤ price * kg * num := by
      rw [show floor * kg * den = floor * den * kg by ac_rfl,
          show price * kg * num = price * num * kg by ac_rfl]
      exact hmul
    have hdiv : floor * kg ≤ price * kg * num / den :=
      (Nat.le_div_iff_mul_le hd).mpr hle'
    have hle : kg * floor ≤ price * kg * num / den := by
      rw [Nat.mul_comm kg floor]
      omega
    rw [Nat.max_eq_left hle]

end JapanTaxLaw.TariffSpecificFloor
