import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 日. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPerioddcf45cd5d8

/-- Statutory period count (日). -/
def limit : Nat := 180

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 180 = true := by decide
theorem sample_false : meets 181 = false := by decide

end JapanTaxLaw.BatchPerioddcf45cd5d8
