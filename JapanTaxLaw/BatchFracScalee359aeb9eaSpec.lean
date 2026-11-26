import JapanTaxLaw.BatchFracScalee359aeb9ea

/-! Independent plain-pair spec; agreement is universal over every Nat base. -/
namespace JapanTaxLaw.BatchFracScalee359aeb9ea

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (7, 10)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchFracScalee359aeb9ea
