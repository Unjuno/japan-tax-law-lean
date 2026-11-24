import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single statutory 百分のX rate.
    Unit and source position are recorded in data/verification_evidence.json. -/
namespace JapanTaxLaw.BatchRateb7727cc6cf

open JapanTaxLaw.TaxFinance

/-- 百分の42 as a fraction with a positivity-typed denominator. -/
def rate : TaxRate := ⟨42, 100, by decide⟩

/-- Amount obtained by applying the rate to a caller-established base. -/
def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = (42, 100) := by decide
theorem at_zero : amount 0 = 0 := by decide
theorem at_100 : amount 100 = 42 := by decide

end JapanTaxLaw.BatchRateb7727cc6cf
