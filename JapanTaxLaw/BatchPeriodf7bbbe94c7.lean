import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriodf7bbbe94c7

/-- Statutory period count (年). -/
def limit : Nat := 7

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 7 = true := by decide
theorem sample_false : meets 8 = false := by decide

end JapanTaxLaw.BatchPeriodf7bbbe94c7
