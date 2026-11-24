import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod11bf18f277

/-- Statutory period count (年). -/
def limit : Nat := 10

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 10 = true := by decide
theorem sample_false : meets 11 = false := by decide

end JapanTaxLaw.BatchPeriod11bf18f277
