import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriodcdfe3ed344

/-- Statutory period count (年). -/
def limit : Nat := 2

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 2 = true := by decide
theorem sample_false : meets 3 = false := by decide

end JapanTaxLaw.BatchPeriodcdfe3ed344
