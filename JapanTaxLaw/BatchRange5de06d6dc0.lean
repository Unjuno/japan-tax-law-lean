import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory range: lower strict, upper inclusive.
    Units: yen. The amount is caller-established. -/
namespace JapanTaxLaw.BatchRange5de06d6dc0

/-- Strict lower edge (円). -/
def lowerYen : Nat := 10000
/-- Inclusive upper edge (円). -/
def upperYen : Nat := 20000

/-- Membership in the range (lower < x ∧ x ≤ upper). -/
def inRange (x : Nat) : Bool := decide (lowerYen < x && x <= upperYen)

theorem at_lower : inRange 10000 = false := by decide
theorem just_above_lower : inRange 10001 = true := by decide
theorem at_upper : inRange 20000 = true := by decide
theorem above_upper : inRange 20001 = false := by decide

end JapanTaxLaw.BatchRange5de06d6dc0
