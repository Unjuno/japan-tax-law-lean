import JapanTaxLaw.TaxFinance

/-! Generated batch template for a statutory range: lower strict, upper inclusive.
    Units: yen. The amount is caller-established. -/
namespace JapanTaxLaw.BatchRangeb8019e2cc1

/-- Strict lower edge (円). -/
def lowerYen : Nat := 1150000
/-- Inclusive upper edge (円). -/
def upperYen : Nat := 1200000

/-- Membership in the range (lower < x ∧ x ≤ upper). -/
def inRange (x : Nat) : Bool := decide (lowerYen < x && x <= upperYen)

theorem at_lower : inRange 1150000 = false := by decide
theorem just_above_lower : inRange 1150001 = true := by decide
theorem at_upper : inRange 1200000 = true := by decide
theorem above_upper : inRange 1200001 = false := by decide

end JapanTaxLaw.BatchRangeb8019e2cc1
