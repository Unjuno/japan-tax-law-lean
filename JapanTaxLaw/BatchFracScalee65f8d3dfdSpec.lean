import JapanTaxLaw.BatchFracScalee65f8d3dfd

/-! Independent plain-pair spec; agreement is universal over every Nat base. -/
namespace JapanTaxLaw.BatchFracScalee65f8d3dfd

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (3, 4)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchFracScalee65f8d3dfd
