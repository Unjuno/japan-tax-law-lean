import JapanTaxLaw.AircraftFuelTaxPayable

/-!
# AircraftFuelTaxPayable spec —独立整数定式

Independent restatement: `payable` is the truncated subtraction of two Money
values (`second - first` with a floor at zero), written here as
`second - min second first`. The universal theorem quantifies over all inputs.
-/

namespace JapanTaxLaw.AircraftFuelTaxPayable

open JapanTaxLaw.TaxFinance

def specPayable (secondItemTax firstItemTax : Money) : Money :=
  secondItemTax - min secondItemTax firstItemTax

theorem agreePayable (secondItemTax firstItemTax : Money) :
    specPayable secondItemTax firstItemTax = payable secondItemTax firstItemTax := by
  unfold specPayable payable
  by_cases h : firstItemTax <= secondItemTax
  · simp [h, min_eq_right h]
  · simp [h, min_eq_left (Nat.le_of_not_ge h)]

example : specPayable 100 40 = 60 := by decide
example : specPayable 100 140 = 0 := by decide

end JapanTaxLaw.AircraftFuelTaxPayable
