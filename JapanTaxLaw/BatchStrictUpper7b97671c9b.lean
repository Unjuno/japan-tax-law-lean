import JapanTaxLaw.TaxFinance

/-! Generated batch template for a strict upper bound (円未満). Unit: yen.
    The compared amount is caller-established. -/
namespace JapanTaxLaw.BatchStrictUpper7b97671c9b

/-- Strict upper bound (円未満), in yen. -/
def upperYen : Nat := 100

/-- True iff the amount is strictly below the bound. -/
def meets (x : Nat) : Bool := decide (x < upperYen)

theorem just_below : meets 99 = true := by decide
theorem at_bound : meets 100 = false := by decide
theorem above_bound : meets 101 = false := by decide

end JapanTaxLaw.BatchStrictUpper7b97671c9b
