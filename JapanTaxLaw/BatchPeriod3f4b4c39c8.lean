import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 月. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod3f4b4c39c8

/-- Statutory period count (月). -/
def limit : Nat := 1

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x < limit)

theorem sample_true : meets 0 = true := by decide
theorem sample_false : meets 1 = false := by decide

end JapanTaxLaw.BatchPeriod3f4b4c39c8
