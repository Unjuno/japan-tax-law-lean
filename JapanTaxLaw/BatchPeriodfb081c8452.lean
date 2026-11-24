import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriodfb081c8452

/-- Statutory period count (年). -/
def limit : Nat := 3

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (limit < x)

theorem sample_true : meets 4 = true := by decide
theorem sample_false : meets 3 = false := by decide

end JapanTaxLaw.BatchPeriodfb081c8452
