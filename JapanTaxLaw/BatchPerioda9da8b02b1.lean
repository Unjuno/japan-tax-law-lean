import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 日. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPerioda9da8b02b1

/-- Statutory period count (日). -/
def limit : Nat := 30

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 30 = true := by decide
theorem sample_false : meets 31 = false := by decide

end JapanTaxLaw.BatchPerioda9da8b02b1
