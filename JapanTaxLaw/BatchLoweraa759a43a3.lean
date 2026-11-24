import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single inclusive lower bound (円以上).
    The compared amount is caller-established; unit is yen. -/
namespace JapanTaxLaw.BatchLoweraa759a43a3

/-- Inclusive lower bound, in yen. -/
def lowerYen : Nat := 5000000000

/-- True iff the amount is at least the statutory lower bound. -/
def meets (x : Nat) : Bool := decide (lowerYen <= x)

theorem at_lower : meets 5000000000 = true := by decide
theorem below_lower : meets 4999999999 = false := by decide
theorem far_above : meets 10000000000 = true := by decide

end JapanTaxLaw.BatchLoweraa759a43a3
