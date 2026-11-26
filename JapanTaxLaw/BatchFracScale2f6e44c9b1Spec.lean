import JapanTaxLaw.BatchFracScale2f6e44c9b1

/-! Independent plain-pair spec; agreement is universal over every Nat base. -/
namespace JapanTaxLaw.BatchFracScale2f6e44c9b1

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (10, 17)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchFracScale2f6e44c9b1
