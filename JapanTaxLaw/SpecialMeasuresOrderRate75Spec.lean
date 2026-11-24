import JapanTaxLaw.SpecialMeasuresOrderRate75

/-!
# SpecialMeasuresOrderRate75 spec — 75/100 の独立定式
Sources (pinned): law 332CO0000000043, revision 332CO0000000043_20261101_507CO0000000127,
art. 5の5 (第五条の五). Independent restatement: base×75/100。
-/

namespace JapanTaxLaw.SpecialMeasuresOrderRate75

def specDelegatedAmount (base : Nat) : Nat :=
  base * 75 / 100

example : specDelegatedAmount 100 = 75 := by decide

def agreeSpecialMeasuresOrderRate75 : Bool :=
  [0, 1, 74, 75, 76, 99, 100, 101, 999, 1_000, 123_457].all fun b =>
    delegatedAmount b == specDelegatedAmount b

example : agreeSpecialMeasuresOrderRate75 = true := by decide

end JapanTaxLaw.SpecialMeasuresOrderRate75
