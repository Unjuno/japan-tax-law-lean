import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 月. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriodbab4d2324f

/-- Statutory period count (月). -/
def limit : Nat := 10

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 10 = true := by decide
theorem sample_false : meets 11 = false := by decide

end JapanTaxLaw.BatchPeriodbab4d2324f
