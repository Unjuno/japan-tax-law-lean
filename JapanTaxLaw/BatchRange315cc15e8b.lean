import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory range: lower strict, upper inclusive.
    Units: yen. The amount is caller-established. -/
namespace JapanTaxLaw.BatchRange315cc15e8b

/-- Strict lower edge (円). -/
def lowerYen : Nat := 3600000
/-- Inclusive upper edge (円). -/
def upperYen : Nat := 7200000

/-- Membership in the range (lower < x ∧ x ≤ upper). -/
def inRange (x : Nat) : Bool := decide (lowerYen < x && x <= upperYen)

theorem at_lower : inRange 3600000 = false := by decide
theorem just_above_lower : inRange 3600001 = true := by decide
theorem at_upper : inRange 7200000 = true := by decide
theorem above_upper : inRange 7200001 = false := by decide

end JapanTaxLaw.BatchRange315cc15e8b
