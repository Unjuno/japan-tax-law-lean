import JapanTaxLaw.BatchFracScale3821cb56be

/-! Independent plain-pair spec; agreement is universal over every Nat base. -/
namespace JapanTaxLaw.BatchFracScale3821cb56be

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (1, 2)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchFracScale3821cb56be
