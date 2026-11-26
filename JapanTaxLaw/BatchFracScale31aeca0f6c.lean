import JapanTaxLaw.TaxFinance

/-! Generated template for a single statutory fraction scaling.
    The base amount is caller-established (Nat). -/
namespace JapanTaxLaw.BatchFracScale31aeca0f6c

open JapanTaxLaw.TaxFinance

def rate : TaxRate := ⟨10, 17, by decide⟩

def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = (10, 17) := by decide
theorem at_denominator : amount 17 = 10 := by decide
theorem at_zero : amount 0 = 0 := by decide

end JapanTaxLaw.BatchFracScale31aeca0f6c
