import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 月. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod8865d40cad

/-- Statutory period count (月). -/
def limit : Nat := 4

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (limit < x)

theorem sample_true : meets 5 = true := by decide
theorem sample_false : meets 4 = false := by decide

end JapanTaxLaw.BatchPeriod8865d40cad
