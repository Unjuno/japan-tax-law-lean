import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 日. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod73fb5d9077

/-- Statutory period count (日). -/
def limit : Nat := 10

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 10 = true := by decide
theorem sample_false : meets 11 = false := by decide

end JapanTaxLaw.BatchPeriod73fb5d9077
