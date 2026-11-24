import JapanTaxLaw.LocalGasolineArt15TripleFineRange

/-!
# LocalGasolineArt15TripleFineRange spec — 三倍/50万円条件の独立定式

Sources (pinned): law 330AC0000000104, revision 330AC0000000104_20260401_508AC0000000012.
Independent restatement: 三倍を a * multiplier とし、範囲判定を否定形
(fine <= floor でない かつ ceiling < fine でない) で書く。実装の識別子は再利用しない。
Agreement is a finite, kernel-decided grid check — NOT a universal theorem.
-/

namespace JapanTaxLaw.LocalGasolineArt15TripleFineRange

def specMultiplier : Nat := 3

def specFloorYen : Nat := 500000

/-- 実装の `triple` とは異なる書き方（被乗数を左に置く）。 -/
def specThrice (a : Nat) : Nat := a * specMultiplier

/-- 実装の `specialApplies` とは異なる比較の書き方。 -/
def specOverFloor (a : Nat) : Bool := decide (specFloorYen < specThrice a)

/-- 範囲内: 下限以下でなく、かつ上限より大きくない。 -/
def specInRange (a fine : Nat) : Bool :=
  (! (fine <= specFloorYen)) && (! (specThrice a < fine))

example : specThrice 3 = 9 := by decide
example : specThrice 166667 = 500001 := by decide
example : specOverFloor 166666 = false := by decide
example : specOverFloor 166667 = true := by decide
example : specInRange 200000 500000 = false := by decide
example : specInRange 200000 600000 = true := by decide

/-- 有限領域の反例検査。普遍的な正しさの主張ではない。 -/
def agreeLocalGasolineArt15TripleFineRange : Bool :=
  [0, 1, 2, 3, 4, 166666, 166667, 200000, 499999, 500000, 500001].all (fun a =>
    (triple a == specThrice a) &&
    (specialApplies a == specOverFloor a) &&
    ([499999, 500000, 500001, specThrice a].all (fun fine =>
      withinFineRange a fine == specInRange a fine)))

example : agreeLocalGasolineArt15TripleFineRange = true := by decide

end JapanTaxLaw.LocalGasolineArt15TripleFineRange
