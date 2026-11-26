import JapanTaxLaw.LocalGrantTaxRatio

/-!
# LocalGrantTaxRatio spec — 94%/6% 配分の独立定式
Sources (pinned): law 325AC0000000211, revision 325AC0000000211_20261102_508AC0000000062.
Independent restatement: base/50*47, base/50*3。
-/

namespace JapanTaxLaw.LocalGrantTaxRatio

def specOrdinary (b : Nat) : Nat := b * 47 / 50
def specSpecial (b : Nat) : Nat := b * 3 / 50

example : specOrdinary 100000 = 94000 := by decide
example : specSpecial 100000 = 6000 := by decide

def agreeLocalGrantTaxRatio : Bool :=
  [0, 1, 50, 100, 100000, 1000000].all fun b =>
    ordinary b == specOrdinary b && special b == specSpecial b

example : agreeLocalGrantTaxRatio = true := by decide

end JapanTaxLaw.LocalGrantTaxRatio
