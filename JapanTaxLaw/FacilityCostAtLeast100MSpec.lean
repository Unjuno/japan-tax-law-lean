import JapanTaxLaw.FacilityCostAtLeast100M

/-! # spec — 1億円以上の独立定式 (law 325CO0000000245 / art.16の2の8)
「一億円」を 100 × 1,000,000 として再記述し境界を照合する。 -/

namespace JapanTaxLaw.FacilityCostAtLeast100M

def specThresholdYen : Nat := 100 * 1_000_000

def specAtLeast100M (cost : Nat) : Bool := cost >= specThresholdYen

def agreeFacilityCostAtLeast100M : Bool :=
  [0, 1, 99_999_999, 100_000_000, 100_000_001, 500_000_000].all fun c =>
    atLeast100M c == specAtLeast100M c

example : agreeFacilityCostAtLeast100M = true := by decide

end JapanTaxLaw.FacilityCostAtLeast100M
