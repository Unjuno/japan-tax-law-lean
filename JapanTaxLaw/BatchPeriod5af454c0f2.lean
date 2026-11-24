import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 日. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod5af454c0f2

/-- Statutory period count (日). -/
def limit : Nat := 60

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 60 = true := by decide
theorem sample_false : meets 61 = false := by decide

end JapanTaxLaw.BatchPeriod5af454c0f2
