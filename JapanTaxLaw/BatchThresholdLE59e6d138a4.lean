import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single statutory monetary threshold.
    Unit and source position are recorded in data/verification_evidence.json. -/
namespace JapanTaxLaw.BatchThresholdLE59e6d138a4

/-- Statutory threshold, in yen. -/
def limit : Nat := 25000
/-- Threshold predicate. Caller supplies the amount in yen. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem at_limit : meets 25000 = true := by decide
theorem beyond_limit : meets 25001 = false := by decide
theorem below_limit : meets 0 = true := by decide

end JapanTaxLaw.BatchThresholdLE59e6d138a4
