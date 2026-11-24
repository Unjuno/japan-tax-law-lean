import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory range: lower strict, upper inclusive.
    Units: yen. The amount is caller-established. -/
namespace JapanTaxLaw.BatchRange51a0d48035

/-- Strict lower edge (円). -/
def lowerYen : Nat := 32000
/-- Inclusive upper edge (円). -/
def upperYen : Nat := 56000

/-- Membership in the range (lower < x ∧ x ≤ upper). -/
def inRange (x : Nat) : Bool := decide (lowerYen < x && x <= upperYen)

theorem at_lower : inRange 32000 = false := by decide
theorem just_above_lower : inRange 32001 = true := by decide
theorem at_upper : inRange 56000 = true := by decide
theorem above_upper : inRange 56001 = false := by decide

end JapanTaxLaw.BatchRange51a0d48035
