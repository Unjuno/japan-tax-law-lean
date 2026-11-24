import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 月. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod8a71942046

/-- Statutory period count (月). -/
def limit : Nat := 2

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 2 = true := by decide
theorem sample_false : meets 3 = false := by decide

end JapanTaxLaw.BatchPeriod8a71942046
