import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single inclusive lower bound (円以上).
    The compared amount is caller-established; unit is yen. -/
namespace JapanTaxLaw.BatchLower4658e9b8c7

/-- Inclusive lower bound, in yen. -/
def lowerYen : Nat := 250000

/-- True iff the amount is at least the statutory lower bound. -/
def meets (x : Nat) : Bool := decide (lowerYen <= x)

theorem at_lower : meets 250000 = true := by decide
theorem below_lower : meets 249999 = false := by decide
theorem far_above : meets 500000 = true := by decide

end JapanTaxLaw.BatchLower4658e9b8c7
