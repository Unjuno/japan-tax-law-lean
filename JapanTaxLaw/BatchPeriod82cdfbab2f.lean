import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 月. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod82cdfbab2f

/-- Statutory period count (月). -/
def limit : Nat := 6

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x < limit)

theorem sample_true : meets 5 = true := by decide
theorem sample_false : meets 6 = false := by decide

end JapanTaxLaw.BatchPeriod82cdfbab2f
