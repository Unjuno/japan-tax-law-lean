import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 日. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriodbdfa8f72ea

/-- Statutory period count (日). -/
def limit : Nat := 45

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 45 = true := by decide
theorem sample_false : meets 46 = false := by decide

end JapanTaxLaw.BatchPeriodbdfa8f72ea
