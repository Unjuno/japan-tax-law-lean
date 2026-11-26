import JapanTaxLaw.BatchFracScale1395ebdd80

/-! Independent plain-pair spec; agreement is universal over every Nat base. -/
namespace JapanTaxLaw.BatchFracScale1395ebdd80

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (4, 105)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchFracScale1395ebdd80
