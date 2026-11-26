import JapanTaxLaw.TaxFinance

/-! Generated template for a single statutory fraction scaling.
    The base amount is caller-established (Nat). -/
namespace JapanTaxLaw.BatchFracScale090677efa2

open JapanTaxLaw.TaxFinance

def rate : TaxRate := ⟨4, 5, by decide⟩

def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = (4, 5) := by decide
theorem at_denominator : amount 5 = 4 := by decide
theorem at_zero : amount 0 = 0 := by decide

end JapanTaxLaw.BatchFracScale090677efa2
