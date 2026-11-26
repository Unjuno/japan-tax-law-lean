import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 月. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod0e3afad516

/-- Statutory period count (月). -/
def limit : Nat := 7

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 7 = true := by decide
theorem sample_false : meets 8 = false := by decide

end JapanTaxLaw.BatchPeriod0e3afad516
