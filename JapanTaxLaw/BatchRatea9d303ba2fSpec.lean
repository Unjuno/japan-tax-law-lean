import JapanTaxLaw.BatchRatea9d303ba2f

/-! Independent restatement using a plain (numerator, denominator) pair,
    without TaxRate. Agreement is universal over every base amount. -/
namespace JapanTaxLaw.BatchRatea9d303ba2f

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (10, 100)

def specAmount (base : Nat) : Nat :=
  base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchRatea9d303ba2f
