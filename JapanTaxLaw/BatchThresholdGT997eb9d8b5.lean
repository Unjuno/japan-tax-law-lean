import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single statutory monetary threshold.
    Unit and source position are recorded in data/verification_evidence.json. -/
namespace JapanTaxLaw.BatchThresholdGT997eb9d8b5

/-- Statutory threshold, in yen. -/
def limit : Nat := 4890000
/-- Threshold predicate. Caller supplies the amount in yen. -/
def meets (x : Nat) : Bool := decide (limit < x)

theorem at_limit : meets 4890000 = false := by decide
theorem beyond_limit : meets 4890001 = true := by decide
theorem below_limit : meets 0 = false := by decide

end JapanTaxLaw.BatchThresholdGT997eb9d8b5
