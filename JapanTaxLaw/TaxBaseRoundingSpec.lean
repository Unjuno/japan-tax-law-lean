import JapanTaxLaw.TaxBaseRounding

/-!
# TaxBaseRounding spec — 千円未満切捨ての独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: amount - amount % 1000。
-/

namespace JapanTaxLaw.TaxBaseRounding

def specRound (a : Nat) : Nat := a - a % 1000

example : specRound 999 = 0 := by decide
example : specRound 123456 = 123000 := by decide

def agreeTaxBaseRounding : Bool :=
  [0, 1, 999, 1000, 1001, 12345, 123456, 1000000].all fun a => roundDownToThousand a == specRound a

example : agreeTaxBaseRounding = true := by decide

end JapanTaxLaw.TaxBaseRounding
