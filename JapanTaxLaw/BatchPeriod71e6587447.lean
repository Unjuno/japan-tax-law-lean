import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod71e6587447

/-- Statutory period count (年). -/
def limit : Nat := 20

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 20 = true := by decide
theorem sample_false : meets 21 = false := by decide

end JapanTaxLaw.BatchPeriod71e6587447
