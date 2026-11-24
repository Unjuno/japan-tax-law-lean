import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 日. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod25e8d28330

/-- Statutory period count (日). -/
def limit : Nat := 60

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (limit < x)

theorem sample_true : meets 61 = true := by decide
theorem sample_false : meets 60 = false := by decide

end JapanTaxLaw.BatchPeriod25e8d28330
