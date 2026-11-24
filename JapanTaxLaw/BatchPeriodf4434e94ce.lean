import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriodf4434e94ce

/-- Statutory period count (年). -/
def limit : Nat := 10

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (limit < x)

theorem sample_true : meets 11 = true := by decide
theorem sample_false : meets 10 = false := by decide

end JapanTaxLaw.BatchPeriodf4434e94ce
