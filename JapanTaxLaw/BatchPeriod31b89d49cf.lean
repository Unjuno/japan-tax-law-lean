import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriod31b89d49cf

/-- Statutory period count (年). -/
def limit : Nat := 2

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 2 = true := by decide
theorem sample_false : meets 3 = false := by decide

end JapanTaxLaw.BatchPeriod31b89d49cf
