import JapanTaxLaw.TaxFinance

/-! Generated template for a single statutory fraction scaling.
    The base amount is caller-established (Nat). -/
namespace JapanTaxLaw.BatchFracScalefd8f206493

open JapanTaxLaw.TaxFinance

def rate : TaxRate := ⟨3, 1000, by decide⟩

def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = (3, 1000) := by decide
theorem at_denominator : amount 1000 = 3 := by decide
theorem at_zero : amount 0 = 0 := by decide

end JapanTaxLaw.BatchFracScalefd8f206493
