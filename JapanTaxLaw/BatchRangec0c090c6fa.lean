import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory range: lower strict, upper inclusive.
    Units: yen. The amount is caller-established. -/
namespace JapanTaxLaw.BatchRangec0c090c6fa

/-- Strict lower edge (円). -/
def lowerYen : Nat := 3360000
/-- Inclusive upper edge (円). -/
def upperYen : Nat := 4890000

/-- Membership in the range (lower < x ∧ x ≤ upper). -/
def inRange (x : Nat) : Bool := decide (lowerYen < x && x <= upperYen)

theorem at_lower : inRange 3360000 = false := by decide
theorem just_above_lower : inRange 3360001 = true := by decide
theorem at_upper : inRange 4890000 = true := by decide
theorem above_upper : inRange 4890001 = false := by decide

end JapanTaxLaw.BatchRangec0c090c6fa
