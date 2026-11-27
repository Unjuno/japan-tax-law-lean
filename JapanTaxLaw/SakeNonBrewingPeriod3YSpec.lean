import JapanTaxLaw.SakeNonBrewingPeriod3Y

/-! # SakeNonBrewingPeriod3Y spec — 3年以上の独立定式 (law 328AC0000000006 / art.12)
「三年以上」を年数 3 の境界（包含）として再記述する。 -/

namespace JapanTaxLaw.SakeNonBrewingPeriod3Y

def specThresholdYears : Nat := 3

def specAtLeast3 (years : Nat) : Bool := years >= specThresholdYears

example : specAtLeast3 2 = false := by decide
example : specAtLeast3 3 = true := by decide

def agreeSakeNonBrewingPeriod3Y : Bool :=
  [0, 1, 2, 3, 4, 12].all fun y => atLeast3 y == specAtLeast3 y

example : agreeSakeNonBrewingPeriod3Y = true := by decide

end JapanTaxLaw.SakeNonBrewingPeriod3Y
