import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single statutory 百分のX rate.
    Unit and source position are recorded in data/verification_evidence.json. -/
namespace JapanTaxLaw.BatchRate68b490d923

open JapanTaxLaw.TaxFinance

/-- 百分の10 as a fraction with a positivity-typed denominator. -/
def rate : TaxRate := ⟨10, 100, by decide⟩

/-- Amount obtained by applying the rate to a caller-established base. -/
def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = (10, 100) := by decide
theorem at_zero : amount 0 = 0 := by decide
theorem at_100 : amount 100 = 10 := by decide

end JapanTaxLaw.BatchRate68b490d923
