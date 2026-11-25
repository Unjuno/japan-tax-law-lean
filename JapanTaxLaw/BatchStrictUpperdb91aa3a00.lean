import JapanTaxLaw.TaxFinance

/-! Generated batch template for a strict upper bound (円未満). Unit: yen.
    The compared amount is caller-established. -/
namespace JapanTaxLaw.BatchStrictUpperdb91aa3a00

/-- Strict upper bound (円未満), in yen. -/
def upperYen : Nat := 200000

/-- True iff the amount is strictly below the bound. -/
def meets (x : Nat) : Bool := decide (x < upperYen)

theorem just_below : meets 199999 = true := by decide
theorem at_bound : meets 200000 = false := by decide
theorem above_bound : meets 200001 = false := by decide

end JapanTaxLaw.BatchStrictUpperdb91aa3a00
