import JapanTaxLaw.TaxFinance

/-! Generated template for a single statutory fraction scaling.
    The base amount is caller-established (Nat). -/
namespace JapanTaxLaw.BatchFracScalebe49bd087d

open JapanTaxLaw.TaxFinance

def rate : TaxRate := ⟨200, 330, by decide⟩

def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = (200, 330) := by decide
theorem at_denominator : amount 330 = 200 := by decide
theorem at_zero : amount 0 = 0 := by decide

end JapanTaxLaw.BatchFracScalebe49bd087d
