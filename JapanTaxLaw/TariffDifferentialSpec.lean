import JapanTaxLaw.TariffDifferential

/-! Independent spec: subtract the smaller of price and ceiling. -/

namespace JapanTaxLaw.TariffDifferential

def specDifferential (price ceiling : Nat) : Nat := ceiling - min ceiling price

theorem differential_agrees (price ceiling : Nat) :
    differential price ceiling = specDifferential price ceiling := by
  unfold differential specDifferential
  by_cases h : price ≤ ceiling
  · have hm : min ceiling price = price := Nat.min_eq_right h
    simp [h, hm]
  · have hm : min ceiling price = ceiling := Nat.min_eq_left (by omega)
    simp [h, hm]

end JapanTaxLaw.TariffDifferential
