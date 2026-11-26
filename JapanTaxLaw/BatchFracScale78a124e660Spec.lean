import JapanTaxLaw.BatchFracScale78a124e660

/-! Independent plain-pair spec; agreement is universal over every Nat base. -/
namespace JapanTaxLaw.BatchFracScale78a124e660

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (1, 3)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchFracScale78a124e660
