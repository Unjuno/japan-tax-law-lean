import JapanTaxLaw.BatchRate9b3f812fc1

/-! Independent restatement using a plain (numerator, denominator) pair,
    without TaxRate. Agreement is universal over every base amount. -/
namespace JapanTaxLaw.BatchRate9b3f812fc1

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (20, 100)

def specAmount (base : Nat) : Nat :=
  base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchRate9b3f812fc1
