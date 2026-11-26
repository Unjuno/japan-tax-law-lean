import JapanTaxLaw.TaxFinance

/-! Generated template for a decimal 百分の rate with denominator 1000. -/
namespace JapanTaxLaw.BatchDecRatec18c49328c

open JapanTaxLaw.TaxFinance

def rate : TaxRate := ⟨907, 1000, by decide⟩

def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = (907, 1000) := by decide
theorem at_1000 : amount 1000 = 907 := by decide
theorem at_zero : amount 0 = 0 := by decide

end JapanTaxLaw.BatchDecRatec18c49328c
