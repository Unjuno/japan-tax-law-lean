import JapanTaxLaw.TaxFinance

/-! Generated template for a single statutory fraction scaling.
    The base amount is caller-established (Nat). -/
namespace JapanTaxLaw.BatchFracScale2d96c70ab9

open JapanTaxLaw.TaxFinance

def rate : TaxRate := ⟨247, 753, by decide⟩

def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = (247, 753) := by decide
theorem at_denominator : amount 753 = 247 := by decide
theorem at_zero : amount 0 = 0 := by decide

end JapanTaxLaw.BatchFracScale2d96c70ab9
