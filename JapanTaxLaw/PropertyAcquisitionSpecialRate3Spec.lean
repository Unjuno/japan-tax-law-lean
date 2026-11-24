import JapanTaxLaw.PropertyAcquisitionSpecialRate3

/-!
# PropertyAcquisitionSpecialRate3 spec — 3/100 の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
art. 11の2 (第十一条の二, 附則). Independent restatement: base×3/100。
-/

namespace JapanTaxLaw.PropertyAcquisitionSpecialRate3

def specSpecialTax (base : Nat) : Nat :=
  base * 3 / 100

example : specSpecialTax 100 = 3 := by decide

def agreePropertyAcquisitionSpecialRate3 : Bool :=
  [0, 1, 2, 3, 4, 99, 100, 101, 999, 1_000, 123_457].all fun b =>
    specialTax b == specSpecialTax b

example : agreePropertyAcquisitionSpecialRate3 = true := by decide

end JapanTaxLaw.PropertyAcquisitionSpecialRate3
