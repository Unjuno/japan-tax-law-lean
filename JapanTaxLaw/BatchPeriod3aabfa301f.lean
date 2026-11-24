import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 日. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod3aabfa301f

/-- Statutory period count (日). -/
def limit : Nat := 5

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 5 = true := by decide
theorem sample_false : meets 6 = false := by decide

end JapanTaxLaw.BatchPeriod3aabfa301f
