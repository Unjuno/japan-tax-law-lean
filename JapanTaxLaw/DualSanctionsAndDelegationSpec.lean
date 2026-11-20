/-!
# DualSanctionsAndDelegationSpec — 独立形式仕様

pinned 原文（両罰規定および残余の委任規定 146条片）から独立に読み取った仕様。
実装を import しない。

両罰: 行為者と法人の双方に罰金が科される（金額は原文片にないため NOT MODELLED）。
残余の委任: 必要な経過措置・事項の内容は政令に委ねられる（NOT MODELLED）。
-/
namespace JapanTaxLaw.DualSanctionsAndDelegationSpec

def dualSanctionSpec (a c : Nat) : Prop := a > 0 ∧ c > 0

def delegationSpec (content : Nat) : Nat := content

end JapanTaxLaw.DualSanctionsAndDelegationSpec
