import JapanTaxLaw.LocalSeparateIncomeTaxRate6

/-!
# LocalSeparateIncomeTaxRate6 spec — 6/100 の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
art. 328の3 (第三百二十八条の三). Independent restatement: base×6/100。
-/

namespace JapanTaxLaw.LocalSeparateIncomeTaxRate6

def specSeparateIncomeTax (base : Nat) : Nat :=
  base * 6 / 100

example : specSeparateIncomeTax 100 = 6 := by decide

def agreeLocalSeparateIncomeTaxRate6 : Bool :=
  [0, 1, 5, 6, 7, 99, 100, 101, 999, 1_000, 123_457].all fun b =>
    separateIncomeTax b == specSeparateIncomeTax b

example : agreeLocalSeparateIncomeTaxRate6 = true := by decide

end JapanTaxLaw.LocalSeparateIncomeTaxRate6
