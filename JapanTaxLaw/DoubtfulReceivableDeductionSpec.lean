import JapanTaxLaw.DoubtfulReceivableDeduction

/-! Independent spec: explicit conditional `if estimate <= receivable then ... else 0`.
The only bridge is the universal kernel-checked omega theorem `agreeBookedAmount`. -/
namespace JapanTaxLaw.DoubtfulReceivableDeduction

@[reducible] def specBooked (receivable estimate : Nat) : Nat :=
  if estimate <= receivable then receivable - estimate else 0

theorem agreeBookedAmount (receivable estimate : Nat) :
    specBooked receivable estimate = bookedAmount receivable estimate := by
  unfold specBooked bookedAmount
  by_cases h : estimate <= receivable
  · simp [h]
  · have hgt : receivable < estimate := Nat.lt_of_not_ge h
    simp [h]
    omega

end JapanTaxLaw.DoubtfulReceivableDeduction
