import JapanTaxLaw.MedicalCorpCapitalOver50

/-! # MedicalCorpCapitalOver50 spec — 50%超の独立定式 (law 332CO0000000043 / art.40の8)
実装の「掛けてから割る」に対し、独立仕様は交差乗算 `100*a > 50*t` で判定する。 -/

namespace JapanTaxLaw.MedicalCorpCapitalOver50

def specPercentNum : Nat := 50
def specRateDen : Nat := 100

def specExceeds (amount total : Nat) : Bool :=
  specRateDen * amount > specPercentNum * total

example : specExceeds 51 100 = true := by decide
example : specExceeds 50 100 = false := by decide

def agreeMedicalCorpCapitalOver50 : Bool :=
  [(0,0),(49,100),(50,100),(51,100),(100,101),(501,1000),(500,1000)].all fun pair =>
    exceeds pair.1 pair.2 == specExceeds pair.1 pair.2

example : agreeMedicalCorpCapitalOver50 = true := by decide

end JapanTaxLaw.MedicalCorpCapitalOver50
