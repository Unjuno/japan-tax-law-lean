import JapanTaxLaw.InterestRateFivePercent

/-!
# Independent spec — 地方税法 art. 71の6 5% rate

The spec writes the percentage as an explicit base-100 fraction and computes
the result independently with Nat multiplication/division. Agreement is a
universal theorem over every base amount, not a grid check.
-/
namespace JapanTaxLaw.InterestRateFivePercent

open JapanTaxLaw.TaxFinance

/-- 百分の五 restated as (numerator, denominator) over 100. -/
def specFraction : Nat × Nat := (5, 100)

/-- Independent computation from the fraction, without using `TaxRate`. -/
def specAmount (base : Nat) : Nat :=
  base * specFraction.1 / specFraction.2

theorem agree_spec_impl (base : Nat) : specAmount base = interestRate.applyFloor base := by
  simp [specAmount, specFraction, interestRate, TaxRate.applyFloor]

example : specFraction = (5, 100) := by decide
example : specAmount 1_000 = 50 := by decide

end JapanTaxLaw.InterestRateFivePercent
