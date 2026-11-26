import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single statutory 百分のX rate.
    Unit and source position are recorded in data/verification_evidence.json. -/
namespace JapanTaxLaw.BatchRate26c1471b06

open JapanTaxLaw.TaxFinance

/-- 百分の160 as a fraction with a positivity-typed denominator. -/
def rate : TaxRate := ⟨160, 100, by decide⟩

/-- Amount obtained by applying the rate to a caller-established base. -/
def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = (160, 100) := by decide
theorem at_zero : amount 0 = 0 := by decide
theorem at_100 : amount 100 = 160 := by decide

end JapanTaxLaw.BatchRate26c1471b06
