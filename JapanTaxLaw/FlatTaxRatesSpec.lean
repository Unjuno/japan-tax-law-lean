import JapanTaxLaw.FlatTaxRates

/-!
# FlatTaxRatesSpec — 独立税率表と全称照合証明

Independent association list transcribed from the same pinned numerals.
`agreeFlatRates` proves implementation == table lookup for ALL 13 constructors
by exhaustive case analysis.
-/

namespace JapanTaxLaw.FlatTaxRates

/-- 独立定額表。 -/
def flatRateTable : List (FlatRateKind × Nat) :=
  [ (FlatRateKind.individualEqualLow, 1_000),
    (FlatRateKind.individualEqualHigh, 3_000),
    (FlatRateKind.golfCourseUse, 800),
    (FlatRateKind.lightOil, 15_000),
    (FlatRateKind.tobaccoLocal, 6_552),
    (FlatRateKind.localGasoline, 4_400),
    (FlatRateKind.gasoline, 24_300),
    (FlatRateKind.aviationFuel, 26_000),
    (FlatRateKind.powerDevelopment, 375),
    (FlatRateKind.tobaccoNational, 6_802),
    (FlatRateKind.internationalTourist, 3_000),
    (FlatRateKind.forestEnvironment, 1_000),
    (FlatRateKind.fixedAssetLarge, 14) ]

def specFlatAmount (k : FlatRateKind) : Nat :=
  match flatRateTable.find? (fun p => p.1 == k) with
  | some p => p.2
  | none => 0

/-- 実装 ≡ 独立表（全 13 規定を網羅）。 -/
theorem agreeFlatRates (k : FlatRateKind) : flatAmount k = specFlatAmount k := by
  cases k <;> native_decide

end JapanTaxLaw.FlatTaxRates
