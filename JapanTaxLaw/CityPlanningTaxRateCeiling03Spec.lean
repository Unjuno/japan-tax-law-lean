import JapanTaxLaw.CityPlanningTaxRateCeiling03

/-! # CityPlanningTaxRateCeiling03 spec — 0.3%上限の独立定式 (law 325AC0000000226 / art.702の4)
「百分の〇・三」を 3/1000 とし、「超えることができない」を
`1000*r <= 3*1000` で判定する（境界値 3 を含む）。 -/

namespace JapanTaxLaw.CityPlanningTaxRateCeiling03

def specCeilingNum : Nat := 3
def specRateDen : Nat := 1000

def specWithinCeiling (rate : Nat) : Bool :=
  specRateDen * rate <= specCeilingNum * specRateDen

example : specWithinCeiling 3 = true := by decide
example : specWithinCeiling 4 = false := by decide

def agreeCityPlanningTaxRateCeiling03 : Bool :=
  [0, 2, 3, 4, 100].all fun r => withinCeiling r == specWithinCeiling r

example : agreeCityPlanningTaxRateCeiling03 = true := by decide

end JapanTaxLaw.CityPlanningTaxRateCeiling03
