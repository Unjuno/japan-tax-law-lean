import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod39fe2b3fc6

/-- Statutory period count (年). -/
def limit : Nat := 3

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 3 = true := by decide
theorem sample_false : meets 4 = false := by decide

end JapanTaxLaw.BatchPeriod39fe2b3fc6
