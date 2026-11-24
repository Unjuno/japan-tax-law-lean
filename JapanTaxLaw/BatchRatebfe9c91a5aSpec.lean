import JapanTaxLaw.BatchRatebfe9c91a5a

/-! Independent restatement using a plain (numerator, denominator) pair,
    without TaxRate. Agreement is universal over every base amount. -/
namespace JapanTaxLaw.BatchRatebfe9c91a5a

open JapanTaxLaw.TaxFinance

def specFraction : Nat × Nat := (6, 100)

def specAmount (base : Nat) : Nat :=
  base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = amount base := by
  simp [specAmount, specFraction, amount, rate, TaxRate.applyFloor]

end JapanTaxLaw.BatchRatebfe9c91a5a
