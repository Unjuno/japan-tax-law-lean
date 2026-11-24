import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single statutory monetary threshold.
    Unit and source position are recorded in data/verification_evidence.json. -/
namespace JapanTaxLaw.BatchThresholdGT8220ff476a

/-- Statutory threshold, in yen. -/
def limit : Nat := 8500000
/-- Threshold predicate. Caller supplies the amount in yen. -/
def meets (x : Nat) : Bool := decide (limit < x)

theorem at_limit : meets 8500000 = false := by decide
theorem beyond_limit : meets 8500001 = true := by decide
theorem below_limit : meets 0 = false := by decide

end JapanTaxLaw.BatchThresholdGT8220ff476a
