import JapanTaxLaw.TaxCreditMonthCap12RoundUp

/-! Independent spec for TaxCreditMonthCap12RoundUp: `min 12 (max 1 x)`. -/

namespace JapanTaxLaw.TaxCreditMonthCap12RoundUpSpec

def specMonths (x : Nat) : Nat := min 12 (max 1 x)
def agree (x : Nat) : Prop := specMonths x = JapanTaxLaw.TaxCreditMonthCap12RoundUp.cappedMonths x

theorem agree_thm (x : Nat) : agree x := by
  unfold agree specMonths JapanTaxLaw.TaxCreditMonthCap12RoundUp.cappedMonths
  unfold JapanTaxLaw.TaxCreditMonthCap12RoundUp.monthFloor JapanTaxLaw.TaxCreditMonthCap12RoundUp.monthCeiling
  by_cases h1 : x < 1
  · have hm : max 1 x = 1 := Nat.max_eq_left (Nat.le_of_lt h1)
    simp [h1, hm]
  · by_cases h2 : 12 < x
    · have hx : 12 <= x := Nat.le_of_lt h2
      have hm : 12 <= max 1 x := Nat.le_trans hx (Nat.le_max_right 1 x)
      simp [h1, h2, Nat.min_eq_left hm]
    · have hx1 : 1 <= x := Nat.le_of_not_gt h1
      have hx12 : x <= 12 := Nat.le_of_not_gt h2
      simp [h1, h2, Nat.max_eq_right hx1, Nat.min_eq_right hx12]

end JapanTaxLaw.TaxCreditMonthCap12RoundUpSpec
