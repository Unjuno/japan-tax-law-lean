import JapanTaxLaw.TaxFinance

/-! Generated template for a single statutory fraction scaling.
    The base amount is caller-established (Nat). -/
namespace JapanTaxLaw.BatchFracScalebe288f170e

open JapanTaxLaw.TaxFinance

def rate : TaxRate := ⟨22, 78, by decide⟩

def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = (22, 78) := by decide
theorem at_denominator : amount 78 = 22 := by decide
theorem at_zero : amount 0 = 0 := by decide

end JapanTaxLaw.BatchFracScalebe288f170e
