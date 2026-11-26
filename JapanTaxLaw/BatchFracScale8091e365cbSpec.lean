import JapanTaxLaw.BatchFracScale8091e365cb

/-! Independent plain-pair spec; agreement is universal over every Nat base. -/
namespace JapanTaxLaw.BatchFracScale8091e365cb

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (5, 10)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchFracScale8091e365cb
