import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory range: lower strict, upper inclusive.
    Units: yen. The amount is caller-established. -/
namespace JapanTaxLaw.BatchRange29a94e56a5

/-- Strict lower edge (円). -/
def lowerYen : Nat := 9000000
/-- Inclusive upper edge (円). -/
def upperYen : Nat := 9500000

/-- Membership in the range (lower < x ∧ x ≤ upper). -/
def inRange (x : Nat) : Bool := decide (lowerYen < x && x <= upperYen)

theorem at_lower : inRange 9000000 = false := by decide
theorem just_above_lower : inRange 9000001 = true := by decide
theorem at_upper : inRange 9500000 = true := by decide
theorem above_upper : inRange 9500001 = false := by decide

end JapanTaxLaw.BatchRange29a94e56a5
