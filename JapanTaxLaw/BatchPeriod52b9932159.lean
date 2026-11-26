import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod52b9932159

/-- Statutory period count (年). -/
def limit : Nat := 50

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (limit < x)

theorem sample_true : meets 51 = true := by decide
theorem sample_false : meets 50 = false := by decide

end JapanTaxLaw.BatchPeriod52b9932159
