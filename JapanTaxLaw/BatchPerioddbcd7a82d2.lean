import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 月. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPerioddbcd7a82d2

/-- Statutory period count (月). -/
def limit : Nat := 11

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (x <= limit)

theorem sample_true : meets 11 = true := by decide
theorem sample_false : meets 12 = false := by decide

end JapanTaxLaw.BatchPerioddbcd7a82d2
