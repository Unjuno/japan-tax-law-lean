import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriodbbd216b824

/-- Statutory period count (年). -/
def limit : Nat := 5

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 5 = true := by decide
theorem sample_false : meets 6 = false := by decide

end JapanTaxLaw.BatchPeriodbbd216b824
