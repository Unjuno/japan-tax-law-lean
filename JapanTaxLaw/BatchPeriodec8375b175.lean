import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriodec8375b175

/-- Statutory period count (年). -/
def limit : Nat := 5

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x < limit)

theorem sample_true : meets 4 = true := by decide
theorem sample_false : meets 5 = false := by decide

end JapanTaxLaw.BatchPeriodec8375b175
