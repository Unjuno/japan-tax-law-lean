import JapanTaxLaw.TaxFinance

/-! Generated template for a single statutory fraction scaling.
    The base amount is caller-established (Nat). -/
namespace JapanTaxLaw.BatchFracScale0ed9c0d5e4

open JapanTaxLaw.TaxFinance

def rate : TaxRate := ⟨12, 22, by decide⟩

def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = (12, 22) := by decide
theorem at_denominator : amount 22 = 12 := by decide
theorem at_zero : amount 0 = 0 := by decide

end JapanTaxLaw.BatchFracScale0ed9c0d5e4
