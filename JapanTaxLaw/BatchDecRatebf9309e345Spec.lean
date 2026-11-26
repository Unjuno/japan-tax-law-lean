import JapanTaxLaw.BatchDecRatebf9309e345

/-! Independent plain-pair spec; agreement is universal over every base. -/
namespace JapanTaxLaw.BatchDecRatebf9309e345

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (907, 1000)

def specAmount (base : Nat) : Nat := base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchDecRatebf9309e345
