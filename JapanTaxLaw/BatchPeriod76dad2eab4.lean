import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 日. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod76dad2eab4

/-- Statutory period count (日). -/
def limit : Nat := 7

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (limit < x)

theorem sample_true : meets 8 = true := by decide
theorem sample_false : meets 7 = false := by decide

end JapanTaxLaw.BatchPeriod76dad2eab4
