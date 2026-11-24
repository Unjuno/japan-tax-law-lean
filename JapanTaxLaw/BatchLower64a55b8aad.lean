import JapanTaxLaw.TaxFinance

/-! Generated batch template for a single inclusive lower bound (円以上).
    The compared amount is caller-established; unit is yen. -/
namespace JapanTaxLaw.BatchLower64a55b8aad

/-- Inclusive lower bound, in yen. -/
def lowerYen : Nat := 1600000

/-- True iff the amount is at least the statutory lower bound. -/
def meets (x : Nat) : Bool := decide (lowerYen <= x)

theorem at_lower : meets 1600000 = true := by decide
theorem below_lower : meets 1599999 = false := by decide
theorem far_above : meets 3200000 = true := by decide

end JapanTaxLaw.BatchLower64a55b8aad
