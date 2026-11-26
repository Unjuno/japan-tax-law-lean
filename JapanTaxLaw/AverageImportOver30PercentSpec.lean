import JapanTaxLaw.AverageImportOver30Percent

/-! # AverageImportOver30Percent spec — 30%比較の独立定式 (law 335AC0000000036 / art.7の3)
実装の「掛けてから割る」に対し、独立仕様は交差乗算 `100*i > 30*c` で同じ判定を与える。 -/

namespace JapanTaxLaw.AverageImportOver30Percent

def specPercentNum : Nat := 30
def specRateDen : Nat := 100

def specExceeds (importQty consumption : Nat) : Bool :=
  specRateDen * importQty > specPercentNum * consumption

example : specExceeds 31 100 = true := by decide
example : specExceeds 30 100 = false := by decide

def agreeAverageImportOver30Percent : Bool :=
  [(0,0),(29,100),(30,100),(31,100),(100,101),(301,1000),(300,1000)].all fun ic =>
    exceeds ic.1 ic.2 == specExceeds ic.1 ic.2

example : agreeAverageImportOver30Percent = true := by decide

end JapanTaxLaw.AverageImportOver30Percent
