import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single statutory monetary threshold.
    Unit and source position are recorded in data/verification_evidence.json. -/
namespace JapanTaxLaw.BatchThresholdGT3372cb7d5e

/-- Statutory threshold, in yen. -/
def limit : Nat := 5000000
/-- Threshold predicate. Caller supplies the amount in yen. -/
def meets (x : Nat) : Bool := decide (limit < x)

theorem at_limit : meets 5000000 = false := by decide
theorem beyond_limit : meets 5000001 = true := by decide
theorem below_limit : meets 0 = false := by decide

end JapanTaxLaw.BatchThresholdGT3372cb7d5e
