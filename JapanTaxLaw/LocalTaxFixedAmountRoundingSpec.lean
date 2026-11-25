import JapanTaxLaw.LocalTaxFixedAmountRounding

/-!
# LocalTaxFixedAmountRounding spec — 百円未満切捨ての独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: amount - amount % 100。
-/

namespace JapanTaxLaw.LocalTaxFixedAmountRounding

def specRound (a : Nat) : Nat := a - a % 100

example : specRound 99 = 0 := by decide
example : specRound 12345 = 12300 := by decide

def agreeLocalTaxFixedAmountRounding : Bool :=
  [0, 1, 99, 100, 101, 999, 12345, 100000].all fun a => roundDownToHundred a == specRound a

example : agreeLocalTaxFixedAmountRounding = true := by decide

end JapanTaxLaw.LocalTaxFixedAmountRounding
