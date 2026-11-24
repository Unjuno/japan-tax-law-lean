import JapanTaxLaw.TaxFinance

/-! Generated batch template for a strict upper bound (円未満). Unit: yen.
    The compared amount is caller-established. -/
namespace JapanTaxLaw.BatchStrictUpper5fa5d8201a

/-- Strict upper bound (円未満), in yen. -/
def upperYen : Nat := 180000

/-- True iff the amount is strictly below the bound. -/
def meets (x : Nat) : Bool := decide (x < upperYen)

theorem just_below : meets 179999 = true := by decide
theorem at_bound : meets 180000 = false := by decide
theorem above_bound : meets 180001 = false := by decide

end JapanTaxLaw.BatchStrictUpper5fa5d8201a
