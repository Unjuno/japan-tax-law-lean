import JapanTaxLaw.LocalSeparateIncomeTaxRate4

/-!
# LocalSeparateIncomeTaxRate4 spec — 4/100 の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
art. 50の4 (第五十条の四). Independent restatement: base×4/100。
-/

namespace JapanTaxLaw.LocalSeparateIncomeTaxRate4

def specSeparateIncomeTax (base : Nat) : Nat :=
  base * 4 / 100

example : specSeparateIncomeTax 100 = 4 := by decide

def agreeLocalSeparateIncomeTaxRate4 : Bool :=
  [0, 1, 3, 4, 5, 99, 100, 101, 999, 1_000, 123_457].all fun b =>
    separateIncomeTax b == specSeparateIncomeTax b

example : agreeLocalSeparateIncomeTaxRate4 = true := by decide

end JapanTaxLaw.LocalSeparateIncomeTaxRate4
