import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory range: lower strict, upper inclusive.
    Units: yen. The amount is caller-established. -/
namespace JapanTaxLaw.BatchRangee596923c09

/-- Strict lower edge (円). -/
def lowerYen : Nat := 950000
/-- Inclusive upper edge (円). -/
def upperYen : Nat := 1150000

/-- Membership in the range (lower < x ∧ x ≤ upper). -/
def inRange (x : Nat) : Bool := decide (lowerYen < x && x <= upperYen)

theorem at_lower : inRange 950000 = false := by decide
theorem just_above_lower : inRange 950001 = true := by decide
theorem at_upper : inRange 1150000 = true := by decide
theorem above_upper : inRange 1150001 = false := by decide

end JapanTaxLaw.BatchRangee596923c09
