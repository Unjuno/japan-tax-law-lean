import JapanTaxLaw.BatchDecRateb3a698ea3b

/-! Independent plain-pair spec; agreement is universal over every base. -/
namespace JapanTaxLaw.BatchDecRateb3a698ea3b

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (232, 1000)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchDecRateb3a698ea3b
