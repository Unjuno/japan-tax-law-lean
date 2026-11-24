import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single inclusive lower bound (円以上).
    The compared amount is caller-established; unit is yen. -/
namespace JapanTaxLaw.BatchLowerb1be295d9f

/-- Inclusive lower bound, in yen. -/
def lowerYen : Nat := 43

/-- True iff the amount is at least the statutory lower bound. -/
def meets (x : Nat) : Bool := decide (lowerYen <= x)

theorem at_lower : meets 43 = true := by decide
theorem below_lower : meets 42 = false := by decide
theorem far_above : meets 86 = true := by decide

end JapanTaxLaw.BatchLowerb1be295d9f
