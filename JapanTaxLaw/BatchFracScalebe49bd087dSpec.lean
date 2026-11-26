import JapanTaxLaw.BatchFracScalebe49bd087d

/-! Independent plain-pair spec; agreement is universal over every Nat base. -/
namespace JapanTaxLaw.BatchFracScalebe49bd087d

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (200, 330)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchFracScalebe49bd087d
