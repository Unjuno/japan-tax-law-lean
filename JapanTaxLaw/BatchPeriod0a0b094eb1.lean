import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod0a0b094eb1

/-- Statutory period count (年). -/
def limit : Nat := 25

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 25 = true := by decide
theorem sample_false : meets 26 = false := by decide

end JapanTaxLaw.BatchPeriod0a0b094eb1
