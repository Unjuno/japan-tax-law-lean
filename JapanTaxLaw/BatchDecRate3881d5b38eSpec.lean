import JapanTaxLaw.BatchDecRate3881d5b38e

/-! Independent plain-pair spec; agreement is universal over every base. -/
namespace JapanTaxLaw.BatchDecRate3881d5b38e

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (14, 1000)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchDecRate3881d5b38e
