import JapanTaxLaw.BatchFracScalee3f61eaea2

/-! Independent plain-pair spec; agreement is universal over every Nat base. -/
namespace JapanTaxLaw.BatchFracScalee3f61eaea2

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (2, 3)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchFracScalee3f61eaea2
