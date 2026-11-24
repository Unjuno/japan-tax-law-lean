import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 日. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriodcf7096c31d

/-- Statutory period count (日). -/
def limit : Nat := 20

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 20 = true := by decide
theorem sample_false : meets 21 = false := by decide

end JapanTaxLaw.BatchPeriodcf7096c31d
