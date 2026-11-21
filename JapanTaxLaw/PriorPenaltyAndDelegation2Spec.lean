/-\!
# PriorPenaltyAndDelegation2Spec — 独立形式仕様

pinned 原文（従前例罰則・附則委任・枝番号 1083条片）から独立に読み取った仕様。
実装を import しない。

施行前の行為には旧法の罰則。用語・委任内容は外部が与える。枝番号は（序数, 枝）の対。
具体的な規定・金額は NOT MODELLED（PROVED_SCOPE / 構造範囲）。
-/
namespace JapanTaxLaw.PriorPenaltyAndDelegation2Spec

def oldPenaltySpec (a e : Nat) : Prop := a < e
def termSpec (t : Nat) : Nat := t
def supplementarySpec (c : Nat) : Nat := c
def subItemSpec (a b : Nat) : Nat × Nat := (a, b)

end JapanTaxLaw.PriorPenaltyAndDelegation2Spec
