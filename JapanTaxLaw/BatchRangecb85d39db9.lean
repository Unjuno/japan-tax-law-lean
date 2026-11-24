import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory range: lower strict, upper inclusive.
    Units: yen. The amount is caller-established. -/
namespace JapanTaxLaw.BatchRangecb85d39db9

/-- Strict lower edge (円). -/
def lowerYen : Nat := 10000000
/-- Inclusive upper edge (円). -/
def upperYen : Nat := 20000000

/-- Membership in the range (lower < x ∧ x ≤ upper). -/
def inRange (x : Nat) : Bool := decide (lowerYen < x && x <= upperYen)

theorem at_lower : inRange 10000000 = false := by decide
theorem just_above_lower : inRange 10000001 = true := by decide
theorem at_upper : inRange 20000000 = true := by decide
theorem above_upper : inRange 20000001 = false := by decide

end JapanTaxLaw.BatchRangecb85d39db9
