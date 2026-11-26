import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 月. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriodec70160441

/-- Statutory period count (月). -/
def limit : Nat := 7

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (limit < x)

theorem sample_true : meets 8 = true := by decide
theorem sample_false : meets 7 = false := by decide

end JapanTaxLaw.BatchPeriodec70160441
