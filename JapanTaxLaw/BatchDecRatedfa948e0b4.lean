import JapanTaxLaw.TaxFinance

/-! Generated template for a decimal 百分の rate with denominator 1000. -/
namespace JapanTaxLaw.BatchDecRatedfa948e0b4

open JapanTaxLaw.TaxFinance

def rate : TaxRate := ⟨753, 1000, by decide⟩

def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = (753, 1000) := by decide
theorem at_1000 : amount 1000 = 753 := by decide
theorem at_zero : amount 0 = 0 := by decide

end JapanTaxLaw.BatchDecRatedfa948e0b4
