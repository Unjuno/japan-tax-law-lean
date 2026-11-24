import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriode75289f2ee

/-- Statutory period count (年). -/
def limit : Nat := 20

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (limit < x)

theorem sample_true : meets 21 = true := by decide
theorem sample_false : meets 20 = false := by decide

end JapanTaxLaw.BatchPeriode75289f2ee
