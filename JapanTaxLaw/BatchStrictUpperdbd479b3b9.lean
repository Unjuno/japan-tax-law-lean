import JapanTaxLaw.TaxFinance

/-! Generated batch template for a strict upper bound (円未満). Unit: yen.
    The compared amount is caller-established. -/
namespace JapanTaxLaw.BatchStrictUpperdbd479b3b9

/-- Strict upper bound (円未満), in yen. -/
def upperYen : Nat := 30000

/-- True iff the amount is strictly below the bound. -/
def meets (x : Nat) : Bool := decide (x < upperYen)

theorem just_below : meets 29999 = true := by decide
theorem at_bound : meets 30000 = false := by decide
theorem above_bound : meets 30001 = false := by decide

end JapanTaxLaw.BatchStrictUpperdbd479b3b9
