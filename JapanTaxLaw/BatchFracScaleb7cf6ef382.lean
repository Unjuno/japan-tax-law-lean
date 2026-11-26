import JapanTaxLaw.TaxFinance

/-! Generated template for a single statutory fraction scaling.
    The base amount is caller-established (Nat). -/
namespace JapanTaxLaw.BatchFracScaleb7cf6ef382

open JapanTaxLaw.TaxFinance

def rate : TaxRate := ⟨9, 10, by decide⟩

def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = (9, 10) := by decide
theorem at_denominator : amount 10 = 9 := by decide
theorem at_zero : amount 0 = 0 := by decide

end JapanTaxLaw.BatchFracScaleb7cf6ef382
