import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory period threshold.
    Unit: 月. Caller supplies the elapsed count in that unit. -/
namespace JapanTaxLaw.BatchPeriodd8f479f861

/-- Statutory period count (月). -/
def limit : Nat := 3

/-- Threshold predicate. -/
def meets (x : Nat) : Bool := decide (limit < x)

theorem sample_true : meets 4 = true := by decide
theorem sample_false : meets 3 = false := by decide

end JapanTaxLaw.BatchPeriodd8f479f861
