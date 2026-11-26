import JapanTaxLaw.BatchFracScalebe288f170e

/-! Independent plain-pair spec; agreement is universal over every Nat base. -/
namespace JapanTaxLaw.BatchFracScalebe288f170e

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (22, 78)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchFracScalebe288f170e
