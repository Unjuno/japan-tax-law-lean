import JapanTaxLaw.TaxFinance

/-! Generated template for a single statutory fraction scaling.
    The base amount is caller-established (Nat). -/
namespace JapanTaxLaw.BatchFracScale0dbc8ed723

open JapanTaxLaw.TaxFinance

def rate : TaxRate := ⟨100, 95, by decide⟩

def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = (100, 95) := by decide
theorem at_denominator : amount 95 = 100 := by decide
theorem at_zero : amount 0 = 0 := by decide

end JapanTaxLaw.BatchFracScale0dbc8ed723
