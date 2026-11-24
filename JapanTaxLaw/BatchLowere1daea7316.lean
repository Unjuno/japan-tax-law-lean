import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single inclusive lower bound (円以上).
    The compared amount is caller-established; unit is yen. -/
namespace JapanTaxLaw.BatchLowere1daea7316

/-- Inclusive lower bound, in yen. -/
def lowerYen : Nat := 600000

/-- True iff the amount is at least the statutory lower bound. -/
def meets (x : Nat) : Bool := decide (lowerYen <= x)

theorem at_lower : meets 600000 = true := by decide
theorem below_lower : meets 599999 = false := by decide
theorem far_above : meets 1200000 = true := by decide

end JapanTaxLaw.BatchLowere1daea7316
