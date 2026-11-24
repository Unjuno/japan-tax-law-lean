import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory range: lower strict, upper inclusive.
    Units: yen. The amount is caller-established. -/
namespace JapanTaxLaw.BatchRange58ff939c82

/-- Strict lower edge (円). -/
def lowerYen : Nat := 1950000
/-- Inclusive upper edge (円). -/
def upperYen : Nat := 3300000

/-- Membership in the range (lower < x ∧ x ≤ upper). -/
def inRange (x : Nat) : Bool := decide (lowerYen < x && x <= upperYen)

theorem at_lower : inRange 1950000 = false := by decide
theorem just_above_lower : inRange 1950001 = true := by decide
theorem at_upper : inRange 3300000 = true := by decide
theorem above_upper : inRange 3300001 = false := by decide

end JapanTaxLaw.BatchRange58ff939c82
