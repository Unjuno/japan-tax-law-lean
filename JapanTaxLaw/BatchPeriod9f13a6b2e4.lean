import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 日. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod9f13a6b2e4

/-- Statutory period count (日). -/
def limit : Nat := 7

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 7 = true := by decide
theorem sample_false : meets 8 = false := by decide

end JapanTaxLaw.BatchPeriod9f13a6b2e4
