import JapanTaxLaw.CityPlanningTaxBase5Percent

/-! # CityPlanningTaxBase5Percent spec — 5%算定の独立定式 (law 325CO0000000245 / art.15)
切り捨て符合要求 `100*amount <= 5*base < 100*(amount+1)` で再記述する。 -/

namespace JapanTaxLaw.CityPlanningTaxBase5Percent

def specPercentNum : Nat := 5
def specRateDen : Nat := 100

def specAgrees (base : Nat) : Bool :=
  specRateDen * amount base <= specPercentNum * base &&
  specPercentNum * base < specRateDen * (amount base + 1)

example : specAgrees 100 = true := by decide
example : specAgrees 1_000 = true := by decide

def agreeCityPlanningTaxBase5Percent : Bool :=
  [0, 1, 99, 100, 101, 1_000, 10_001].all specAgrees

example : agreeCityPlanningTaxBase5Percent = true := by decide

end JapanTaxLaw.CityPlanningTaxBase5Percent
