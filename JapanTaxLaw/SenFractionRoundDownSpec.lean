import JapanTaxLaw.SenFractionRoundDown

/-!
# SenFractionRoundDown spec — 一銭未満切捨ての独立定式
Sources (pinned): law 360M50000040001, revision 360M50000040001_20240401_506M60000040021.
Independent restatement: floor(x/10)*10（10 の倍数への切り捨て）。
-/

namespace JapanTaxLaw.SenFractionRoundDown

def specRound (x : Nat) : Nat := x - x % 10

example : specRound 9 = 0 := by decide
example : specRound 15 = 10 := by decide

def agreeSenFractionRoundDown : Bool :=
  [0, 1, 9, 10, 11, 15, 99, 105, 1000].all fun x => roundDownToSen x == specRound x

example : agreeSenFractionRoundDown = true := by decide

end JapanTaxLaw.SenFractionRoundDown
