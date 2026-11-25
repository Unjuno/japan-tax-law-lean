import JapanTaxLaw.LocalTaxStandardRateCeiling2

/-!
# LocalTaxStandardRateCeiling2 spec — 2%上限の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
art. 51 (第五十一条). Independent restatement: rate <= 2（100分率、境界値を含む）。
-/

namespace JapanTaxLaw.LocalTaxStandardRateCeiling2

def specCeiling (rate : Nat) : Bool :=
  rate <= 2

example : specCeiling 2 = true := by decide
example : specCeiling 3 = false := by decide

def agreeLocalTaxStandardRateCeiling2 : Bool :=
  [0, 1, 2, 3, 4, 99, 100].all fun r =>
    withinCeiling r == specCeiling r

example : agreeLocalTaxStandardRateCeiling2 = true := by decide

end JapanTaxLaw.LocalTaxStandardRateCeiling2
