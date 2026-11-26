import JapanTaxLaw.BatchFracScalec8fa12ad2d

/-! Independent plain-pair spec; agreement is universal over every Nat base. -/
namespace JapanTaxLaw.BatchFracScalec8fa12ad2d

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (5, 10)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchFracScalec8fa12ad2d
