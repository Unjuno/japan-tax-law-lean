import JapanTaxLaw.TaxFinance

/-! Generated template for a decimal 百分の rate with denominator 1000. -/
namespace JapanTaxLaw.BatchDecRate64d97e7bb8

open JapanTaxLaw.TaxFinance

def rate : TaxRate := ⟨103, 1000, by decide⟩

def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = (103, 1000) := by decide
theorem at_1000 : amount 1000 = 103 := by decide
theorem at_zero : amount 0 = 0 := by decide

end JapanTaxLaw.BatchDecRate64d97e7bb8
