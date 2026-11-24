import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single inclusive lower bound (円以上).
    The compared amount is caller-established; unit is yen. -/
namespace JapanTaxLaw.BatchLower4186065419

/-- Inclusive lower bound, in yen. -/
def lowerYen : Nat := 100000000000

/-- True iff the amount is at least the statutory lower bound. -/
def meets (x : Nat) : Bool := decide (lowerYen <= x)

theorem at_lower : meets 100000000000 = true := by decide
theorem below_lower : meets 99999999999 = false := by decide
theorem far_above : meets 200000000000 = true := by decide

end JapanTaxLaw.BatchLower4186065419
