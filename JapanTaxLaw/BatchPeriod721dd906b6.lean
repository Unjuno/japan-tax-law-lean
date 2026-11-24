import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod721dd906b6

/-- Statutory period count (年). -/
def limit : Nat := 1

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (limit < x)

theorem sample_true : meets 2 = true := by decide
theorem sample_false : meets 1 = false := by decide

end JapanTaxLaw.BatchPeriod721dd906b6
