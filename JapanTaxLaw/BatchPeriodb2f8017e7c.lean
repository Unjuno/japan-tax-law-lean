import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriodb2f8017e7c

/-- Statutory period count (年). -/
def limit : Nat := 40

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 40 = true := by decide
theorem sample_false : meets 41 = false := by decide

end JapanTaxLaw.BatchPeriodb2f8017e7c
