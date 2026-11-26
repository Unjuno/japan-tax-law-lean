import JapanTaxLaw.TaxFinance

/-! Generated template for a single statutory fraction scaling.
    The base amount is caller-established (Nat). -/
namespace JapanTaxLaw.BatchFracScalee65f8d3dfd

open JapanTaxLaw.TaxFinance

def rate : TaxRate := ⟨3, 4, by decide⟩

def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = (3, 4) := by decide
theorem at_denominator : amount 4 = 3 := by decide
theorem at_zero : amount 0 = 0 := by decide

end JapanTaxLaw.BatchFracScalee65f8d3dfd
