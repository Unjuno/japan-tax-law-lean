import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single inclusive lower bound (円以上).
    The compared amount is caller-established; unit is yen. -/
namespace JapanTaxLaw.BatchLowerb759012336

/-- Inclusive lower bound, in yen. -/
def lowerYen : Nat := 380000

/-- True iff the amount is at least the statutory lower bound. -/
def meets (x : Nat) : Bool := decide (lowerYen <= x)

theorem at_lower : meets 380000 = true := by decide
theorem below_lower : meets 379999 = false := by decide
theorem far_above : meets 760000 = true := by decide

end JapanTaxLaw.BatchLowerb759012336
