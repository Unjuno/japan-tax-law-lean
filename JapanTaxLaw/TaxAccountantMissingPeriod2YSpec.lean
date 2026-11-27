import JapanTaxLaw.TaxAccountantMissingPeriod2Y

/-! # TaxAccountantMissingPeriod2Y spec — 2年以上の独立定式 (law 326AC1000000237 / art.25)
「二年以上」を年数 2 の境界（包含）として再記述する。 -/

namespace JapanTaxLaw.TaxAccountantMissingPeriod2Y

def specThresholdYears : Nat := 2

def specAtLeast2 (years : Nat) : Bool := years >= specThresholdYears

example : specAtLeast2 1 = false := by decide
example : specAtLeast2 2 = true := by decide

def agreeTaxAccountantMissingPeriod2Y : Bool :=
  [0, 1, 2, 3, 12].all fun y => atLeast2 y == specAtLeast2 y

example : agreeTaxAccountantMissingPeriod2Y = true := by decide

end JapanTaxLaw.TaxAccountantMissingPeriod2Y
