import JapanTaxLaw.BatchFracScalea26f604093

/-! Independent plain-pair spec; agreement is universal over every Nat base. -/
namespace JapanTaxLaw.BatchFracScalea26f604093

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (1, 2)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchFracScalea26f604093
