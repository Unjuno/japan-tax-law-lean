import JapanTaxLaw.SalesRatioBracket

/-!
# SalesRatioBracket spec — 3 区分の独立定式
Sources (pinned): law 423CO0000000112, revision 423CO0000000112_20260401_508CO0000000102.
Independent restatement: 閾値を境界として上から順に判定。
-/

namespace JapanTaxLaw.SalesRatioBracket

def specBracket (r : Nat) : Nat :=
  if 100 <= r then 80 else if 70 <= r then 40 else 0

example : specBracket 100 = 80 := by decide
example : specBracket 70 = 40 := by decide
example : specBracket 69 = 0 := by decide

def agreeSalesRatioBracket : Bool :=
  [0, 69, 70, 99, 100, 150, 200].all fun r => bracket r == specBracket r

example : agreeSalesRatioBracket = true := by decide

end JapanTaxLaw.SalesRatioBracket
