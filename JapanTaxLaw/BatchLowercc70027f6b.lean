import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single inclusive lower bound (円以上).
    The compared amount is caller-established; unit is yen. -/
namespace JapanTaxLaw.BatchLowercc70027f6b

/-- Inclusive lower bound, in yen. -/
def lowerYen : Nat := 300000

/-- True iff the amount is at least the statutory lower bound. -/
def meets (x : Nat) : Bool := decide (lowerYen <= x)

theorem at_lower : meets 300000 = true := by decide
theorem below_lower : meets 299999 = false := by decide
theorem far_above : meets 600000 = true := by decide

end JapanTaxLaw.BatchLowercc70027f6b
