import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory range: lower strict, upper inclusive.
    Units: yen. The amount is caller-established. -/
namespace JapanTaxLaw.BatchRange64f2150d0e

/-- Strict lower edge (円). -/
def lowerYen : Nat := 3000000
/-- Inclusive upper edge (円). -/
def upperYen : Nat := 5000000

/-- Membership in the range (lower < x ∧ x ≤ upper). -/
def inRange (x : Nat) : Bool := decide (lowerYen < x && x <= upperYen)

theorem at_lower : inRange 3000000 = false := by decide
theorem just_above_lower : inRange 3000001 = true := by decide
theorem at_upper : inRange 5000000 = true := by decide
theorem above_upper : inRange 5000001 = false := by decide

end JapanTaxLaw.BatchRange64f2150d0e
