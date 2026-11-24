import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory range: lower strict, upper inclusive.
    Units: yen. The amount is caller-established. -/
namespace JapanTaxLaw.BatchRange1072abd81b

/-- Strict lower edge (円). -/
def lowerYen : Nat := 200000000
/-- Inclusive upper edge (円). -/
def upperYen : Nat := 300000000

/-- Membership in the range (lower < x ∧ x ≤ upper). -/
def inRange (x : Nat) : Bool := decide (lowerYen < x && x <= upperYen)

theorem at_lower : inRange 200000000 = false := by decide
theorem just_above_lower : inRange 200000001 = true := by decide
theorem at_upper : inRange 300000000 = true := by decide
theorem above_upper : inRange 300000001 = false := by decide

end JapanTaxLaw.BatchRange1072abd81b
