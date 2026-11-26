import JapanTaxLaw.TaxFinance

/-! Generated template for a single-unit round-up norm.
    The amount to be rounded is caller-established (Nat). -/
namespace JapanTaxLaw.BatchRoundUp34cf76492e

/-- Rounding unit, in yen. -/
def unit : Nat := 100

/-- Statutory round-up: add one unit when a remainder exists. -/
def roundUpAmount (x : Nat) : Nat :=
  x / unit * unit + (if x % unit == 0 then 0 else unit)

end JapanTaxLaw.BatchRoundUp34cf76492e
