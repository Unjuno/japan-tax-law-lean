import JapanTaxLaw.AircraftFuelTaxPayable

/-!
# AircraftFuelTaxPayable spec —独立整数定式

Independent restatement: `payable` is saturating subtraction of two Money
values. The spec writes it directly as `second - first` (Nat subtraction
already floors at zero), while the implementation uses an explicit conditional.
The universal theorem quantifies over all inputs.
-/

namespace JapanTaxLaw.AircraftFuelTaxPayable

open JapanTaxLaw.TaxFinance

def specPayable (secondItemTax firstItemTax : Money) : Money :=
  secondItemTax - firstItemTax

theorem agreePayable (secondItemTax firstItemTax : Money) :
    specPayable secondItemTax firstItemTax = payable secondItemTax firstItemTax := by
  unfold specPayable payable
  by_cases h : firstItemTax <= secondItemTax
  · simp [h]
  · have hle : secondItemTax <= firstItemTax := Nat.le_of_not_ge h
    simp [h, Nat.sub_eq_zero_of_le hle]

example : specPayable 100 40 = 60 := by decide
example : specPayable 100 140 = 0 := by decide

end JapanTaxLaw.AircraftFuelTaxPayable
