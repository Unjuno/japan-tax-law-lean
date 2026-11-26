import JapanTaxLaw.TaxFinance

/-! Generated template for a single statutory deduction. Eligibility is
    caller-established (Bool) and is NOT resolved by this pipeline. -/
namespace JapanTaxLaw.BatchDeduct89b33be287

/-- Statutory deduction, in yen. -/
def deduction : Nat := 270000

/-- Saturating deduction: the base never goes below zero. -/
def afterDeduction (eligible : Bool) (base : Nat) : Nat :=
  if eligible then base - Nat.min base deduction else base

end JapanTaxLaw.BatchDeduct89b33be287
