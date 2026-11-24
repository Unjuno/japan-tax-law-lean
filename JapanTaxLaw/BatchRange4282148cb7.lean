import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory range: lower strict, upper inclusive.
    Units: yen. The amount is caller-established. -/
namespace JapanTaxLaw.BatchRange4282148cb7

/-- Strict lower edge (円). -/
def lowerYen : Nat := 1900000
/-- Inclusive upper edge (円). -/
def upperYen : Nat := 3600000

/-- Membership in the range (lower < x ∧ x ≤ upper). -/
def inRange (x : Nat) : Bool := decide (lowerYen < x && x <= upperYen)

theorem at_lower : inRange 1900000 = false := by decide
theorem just_above_lower : inRange 1900001 = true := by decide
theorem at_upper : inRange 3600000 = true := by decide
theorem above_upper : inRange 3600001 = false := by decide

end JapanTaxLaw.BatchRange4282148cb7
