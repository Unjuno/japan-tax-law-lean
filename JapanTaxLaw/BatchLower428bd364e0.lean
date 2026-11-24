import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single inclusive lower bound (円以上).
    The compared amount is caller-established; unit is yen. -/
namespace JapanTaxLaw.BatchLower428bd364e0

/-- Inclusive lower bound, in yen. -/
def lowerYen : Nat := 400000

/-- True iff the amount is at least the statutory lower bound. -/
def meets (x : Nat) : Bool := decide (lowerYen <= x)

theorem at_lower : meets 400000 = true := by decide
theorem below_lower : meets 399999 = false := by decide
theorem far_above : meets 800000 = true := by decide

end JapanTaxLaw.BatchLower428bd364e0
