import JapanTaxLaw.BatchFracScaleb7cf6ef382

/-! Independent plain-pair spec; agreement is universal over every Nat base. -/
namespace JapanTaxLaw.BatchFracScaleb7cf6ef382

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (9, 10)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchFracScaleb7cf6ef382
