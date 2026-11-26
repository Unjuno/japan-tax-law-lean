import JapanTaxLaw.LifePremiumDeduction

set_option maxRecDepth 10000

/-! Independent spec: min-based slice formulation with reduced quotients. -/

namespace JapanTaxLaw.LifePremiumDeduction

def specDeduction (total : Nat) : Nat :=
  min total 20_000
  + (min total 40_000 - 20_000) / 2
  + (min total 80_000 - 40_000) / 4

theorem agreeDeduction (total : Nat) : deduction total = specDeduction total := by
  unfold deduction specDeduction
  by_cases h1 : total ≤ 20_000
  · have h40 : min total 40_000 = total := Nat.min_eq_left (by omega)
    have h80 : min total 80_000 = total := Nat.min_eq_left (by omega)
    simp [h1, h40, h80]
    omega
  · by_cases h2 : total ≤ 40_000
    · have h40 : min total 40_000 = total := Nat.min_eq_left (by omega)
      have h80 : min total 80_000 = total := Nat.min_eq_left (by omega)
      simp [h1, h2, h40, h80]
      omega
    · by_cases h3 : total ≤ 80_000
      · have h80 : min total 80_000 = total := Nat.min_eq_left (by omega)
        simp [h1, h2, h3, h80]
        omega
      · have h40 : min total 40_000 = 40_000 := Nat.min_eq_right (by omega)
        have h80 : min total 80_000 = 80_000 := Nat.min_eq_right (by omega)
        simp [h1, h2, h3, h40, h80]
        omega

end JapanTaxLaw.LifePremiumDeduction
