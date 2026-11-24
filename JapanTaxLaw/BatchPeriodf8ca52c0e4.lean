import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 日. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriodf8ca52c0e4

/-- Statutory period count (日). -/
def limit : Nat := 50

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 50 = true := by decide
theorem sample_false : meets 51 = false := by decide

end JapanTaxLaw.BatchPeriodf8ca52c0e4
