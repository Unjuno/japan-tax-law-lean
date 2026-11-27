import JapanTaxLaw.LightOilNonHandlingPeriod1Y

/-! # LightOilNonHandlingPeriod1Y spec — 1年以上の独立定式 (law 325CO0000000245 / art.43の8)
「一年以上」を年数 1 の境界（包含）として再記述する。 -/

namespace JapanTaxLaw.LightOilNonHandlingPeriod1Y

def specThresholdYears : Nat := 1

def specAtLeast1 (years : Nat) : Bool := years >= specThresholdYears

example : specAtLeast1 0 = false := by decide
example : specAtLeast1 1 = true := by decide

def agreeLightOilNonHandlingPeriod1Y : Bool :=
  [0, 1, 2, 12].all fun y => atLeast1 y == specAtLeast1 y

example : agreeLightOilNonHandlingPeriod1Y = true := by decide

end JapanTaxLaw.LightOilNonHandlingPeriod1Y
