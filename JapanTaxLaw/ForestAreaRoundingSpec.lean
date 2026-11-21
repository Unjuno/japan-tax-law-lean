import JapanTaxLaw.ForestAreaRounding

/-!
# ForestAreaRounding spec — 面積補正 端数処理 の独立整数定式
Sources (pinned): law 431M60000008040, revision 431M60000008040_20261021_508M60000008119.
Independent restatement: roundHa(tenths) = (tenths+5)/10（0.5ha 以上繰上）。
-/

namespace JapanTaxLaw.ForestAreaRounding

def specRound (t : Nat) : Nat := (t + 5) / 10

example : specRound 4 = 0 := by decide
example : specRound 5 = 1 := by decide
example : specRound 25 = 3 := by decide

def agreeForestAreaRounding : Bool :=
  [0, 1, 4, 5, 9, 10, 14, 15, 25, 100].all fun t => roundHa t == specRound t

example : agreeForestAreaRounding = true := by decide

end JapanTaxLaw.ForestAreaRounding
