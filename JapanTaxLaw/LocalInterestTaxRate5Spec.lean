import JapanTaxLaw.LocalInterestTaxRate5

/-!
# LocalInterestTaxRate5 spec — 5/100 の独立定式

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
art. 71の6 (第七十一条の六). Independent restatement: base×5/100。
-/

namespace JapanTaxLaw.LocalInterestTaxRate5

def specInterestTax (base : Nat) : Nat :=
  base * 5 / 100

example : specInterestTax 100 = 5 := by decide

def agreeLocalInterestTaxRate5 : Bool :=
  [0, 1, 4, 5, 6, 99, 100, 101, 999, 1_000, 123_457].all fun b =>
    interestShareTax b == specInterestTax b

example : agreeLocalInterestTaxRate5 = true := by decide

end JapanTaxLaw.LocalInterestTaxRate5
