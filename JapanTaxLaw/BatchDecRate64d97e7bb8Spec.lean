import JapanTaxLaw.BatchDecRate64d97e7bb8

/-! Independent plain-pair spec; agreement is universal over every base. -/
namespace JapanTaxLaw.BatchDecRate64d97e7bb8

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (103, 1000)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchDecRate64d97e7bb8
