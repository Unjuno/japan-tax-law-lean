import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single statutory 百分のX rate.
    Unit and source position are recorded in data/verification_evidence.json. -/
namespace JapanTaxLaw.BatchRate484df99a50

open JapanTaxLaw.TaxFinance

/-- 百分の6 as a fraction with a positivity-typed denominator. -/
def rate : TaxRate := ⟨6, 100, by decide⟩

/-- Amount obtained by applying the rate to a caller-established base. -/
def amount (base : Nat) : Nat := rate.applyFloor base

theorem rate_components : TaxRate.numDen rate = (6, 100) := by decide
theorem at_zero : amount 0 = 0 := by decide
theorem at_100 : amount 100 = 6 := by decide

end JapanTaxLaw.BatchRate484df99a50
