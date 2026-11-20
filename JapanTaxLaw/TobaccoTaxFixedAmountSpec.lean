import JapanTaxLaw.TobaccoTaxFixedAmount

/-!
# TobaccoTaxFixedAmount spec — 地方税法施行規則 art.16の4の4 の独立整数定式
Sources (pinned): law 329M50000002023, revision 329M50000002023_20261101_508M60000008045.
Independent restatement: 算式 A×((C×2)/B)、千円未満を切り上げ（round up）。
-/

namespace JapanTaxLaw.TobaccoTaxFixedAmount

def specRoundUp (x : Nat) : Nat := if x = 0 then 0 else (x + 999) / 1000 * 1000
def specFixed (a b c : Nat) : Nat := if b = 0 then 0 else specRoundUp (a * (c * 2) / b)

example : specFixed 100000 1000 10 = 2000 := by decide
example : specFixed 1000 300 1 = 1000 := by decide
example : specFixed 1000 0 10 = 0 := by decide

def agreeTobaccoTaxFixedAmount : Bool :=
  [100000, 1000, 0, 500].all fun a =>
    [1, 200, 300, 1000, 0].all fun b =>
      [0, 1, 5, 10].all fun c =>
        fixedAmount a b c == specFixed a b c
example : agreeTobaccoTaxFixedAmount = true := by decide

end JapanTaxLaw.TobaccoTaxFixedAmount
