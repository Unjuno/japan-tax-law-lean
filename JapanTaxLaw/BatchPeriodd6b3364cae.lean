import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 年. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriodd6b3364cae

/-- Statutory period count (年). -/
def limit : Nat := 45

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 45 = true := by decide
theorem sample_false : meets 46 = false := by decide

end JapanTaxLaw.BatchPeriodd6b3364cae
