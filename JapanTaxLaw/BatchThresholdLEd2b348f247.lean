import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single statutory monetary threshold.
    Unit and source position are recorded in data/verification_evidence.json. -/
namespace JapanTaxLaw.BatchThresholdLEd2b348f247

/-- Statutory threshold, in yen. -/
def limit : Nat := 30000
/-- Threshold predicate. Caller supplies the amount in yen. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem at_limit : meets 30000 = true := by decide
theorem beyond_limit : meets 30001 = false := by decide
theorem below_limit : meets 0 = true := by decide

end JapanTaxLaw.BatchThresholdLEd2b348f247
