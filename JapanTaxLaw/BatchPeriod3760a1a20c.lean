import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 月. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod3760a1a20c

/-- Statutory period count (月). -/
def limit : Nat := 1

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 1 = true := by decide
theorem sample_false : meets 2 = false := by decide

end JapanTaxLaw.BatchPeriod3760a1a20c
