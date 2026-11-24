import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod71e16195a5

/-- Statutory period count (年). -/
def limit : Nat := 10

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 10 = true := by decide
theorem sample_false : meets 11 = false := by decide

end JapanTaxLaw.BatchPeriod71e16195a5
