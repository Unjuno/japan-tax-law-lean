import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriodb2e5b269ef

/-- Statutory period count (年). -/
def limit : Nat := 55

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (limit < x)

theorem sample_true : meets 56 = true := by decide
theorem sample_false : meets 55 = false := by decide

end JapanTaxLaw.BatchPeriodb2e5b269ef
