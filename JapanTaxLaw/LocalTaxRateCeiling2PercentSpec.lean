import JapanTaxLaw.LocalTaxRateCeiling2Percent

/-!
# LocalTaxRateCeiling2Percent spec — 2/100 上限の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
art. 51 (第五十一条) ただし書. Independent restatement: rate <= 2（100分率）。
-/

namespace JapanTaxLaw.LocalTaxRateCeiling2Percent

def specWithinCeiling (ratePerHundred : Nat) : Bool :=
  ratePerHundred <= 2

example : specWithinCeiling 2 = true := by decide
example : specWithinCeiling 3 = false := by decide

def agreeLocalTaxRateCeiling2Percent : Bool :=
  [0, 1, 2, 3, 99, 100, 101].all fun r =>
    withinCeiling r == specWithinCeiling r

example : agreeLocalTaxRateCeiling2Percent = true := by decide

end JapanTaxLaw.LocalTaxRateCeiling2Percent
