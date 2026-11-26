import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriodee477b322a

/-- Statutory period count (年). -/
def limit : Nat := 35

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 35 = true := by decide
theorem sample_false : meets 36 = false := by decide

end JapanTaxLaw.BatchPeriodee477b322a
