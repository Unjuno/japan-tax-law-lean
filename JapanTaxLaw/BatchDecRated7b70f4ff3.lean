import JapanTaxLaw.TaxFinance

/-! Generated template for a decimal 百分の rate with denominator 1000. -/
namespace JapanTaxLaw.BatchDecRated7b70f4ff3

open JapanTaxLaw.TaxFinance

def rate : TaxRate := ⟨3, 1000, by decide⟩

def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = (3, 1000) := by decide
theorem at_1000 : amount 1000 = 3 := by decide
theorem at_zero : amount 0 = 0 := by decide

end JapanTaxLaw.BatchDecRated7b70f4ff3
