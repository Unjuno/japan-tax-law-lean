import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory range: lower strict, upper inclusive.
    Units: yen. The amount is caller-established. -/
namespace JapanTaxLaw.BatchRange54d9b8bbf1

/-- Strict lower edge (円). -/
def lowerYen : Nat := 6600000
/-- Inclusive upper edge (円). -/
def upperYen : Nat := 8500000

/-- Membership in the range (lower < x ∧ x ≤ upper). -/
def inRange (x : Nat) : Bool := decide (lowerYen < x && x <= upperYen)

theorem at_lower : inRange 6600000 = false := by decide
theorem just_above_lower : inRange 6600001 = true := by decide
theorem at_upper : inRange 8500000 = true := by decide
theorem above_upper : inRange 8500001 = false := by decide

end JapanTaxLaw.BatchRange54d9b8bbf1
