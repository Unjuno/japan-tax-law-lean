import JapanTaxLaw.TaxFinance

/-! Generated template for a single statutory fraction scaling.
    The base amount is caller-established (Nat). -/
namespace JapanTaxLaw.BatchFracScalee3f61eaea2

open JapanTaxLaw.TaxFinance

def rate : TaxRate := ⟨2, 3, by decide⟩

def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = (2, 3) := by decide
theorem at_denominator : amount 3 = 2 := by decide
theorem at_zero : amount 0 = 0 := by decide

end JapanTaxLaw.BatchFracScalee3f61eaea2
