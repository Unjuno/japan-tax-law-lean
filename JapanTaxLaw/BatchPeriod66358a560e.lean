import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 月. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod66358a560e

/-- Statutory period count (月). -/
def limit : Nat := 3

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 3 = true := by decide
theorem sample_false : meets 4 = false := by decide

end JapanTaxLaw.BatchPeriod66358a560e
