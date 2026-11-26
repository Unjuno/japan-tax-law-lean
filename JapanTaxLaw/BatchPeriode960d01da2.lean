import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriode960d01da2

/-- Statutory period count (年). -/
def limit : Nat := 55

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 55 = true := by decide
theorem sample_false : meets 56 = false := by decide

end JapanTaxLaw.BatchPeriode960d01da2
