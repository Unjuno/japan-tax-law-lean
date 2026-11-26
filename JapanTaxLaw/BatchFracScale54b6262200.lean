import JapanTaxLaw.TaxFinance

/-! Generated template for a single statutory fraction scaling.
    The base amount is caller-established (Nat). -/
namespace JapanTaxLaw.BatchFracScale54b6262200

open JapanTaxLaw.TaxFinance

def rate : TaxRate := ⟨93, 907, by decide⟩

def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = (93, 907) := by decide
theorem at_denominator : amount 907 = 93 := by decide
theorem at_zero : amount 0 = 0 := by decide

end JapanTaxLaw.BatchFracScale54b6262200
