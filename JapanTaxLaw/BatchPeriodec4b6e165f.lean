import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriodec4b6e165f

/-- Statutory period count (年). -/
def limit : Nat := 2

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (limit < x)

theorem sample_true : meets 3 = true := by decide
theorem sample_false : meets 2 = false := by decide

end JapanTaxLaw.BatchPeriodec4b6e165f
