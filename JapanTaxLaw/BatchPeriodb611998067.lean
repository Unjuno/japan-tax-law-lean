import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 月. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriodb611998067

/-- Statutory period count (月). -/
def limit : Nat := 6

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 6 = true := by decide
theorem sample_false : meets 7 = false := by decide

end JapanTaxLaw.BatchPeriodb611998067
