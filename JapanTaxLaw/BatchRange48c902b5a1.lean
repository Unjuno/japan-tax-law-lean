import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory range: lower strict, upper inclusive.
    Units: yen. The amount is caller-established. -/
namespace JapanTaxLaw.BatchRange48c902b5a1

/-- Strict lower edge (円). -/
def lowerYen : Nat := 10000000
/-- Inclusive upper edge (円). -/
def upperYen : Nat := 100000000

/-- Membership in the range (lower < x ∧ x ≤ upper). -/
def inRange (x : Nat) : Bool := decide (lowerYen < x && x <= upperYen)

theorem at_lower : inRange 10000000 = false := by decide
theorem just_above_lower : inRange 10000001 = true := by decide
theorem at_upper : inRange 100000000 = true := by decide
theorem above_upper : inRange 100000001 = false := by decide

end JapanTaxLaw.BatchRange48c902b5a1
