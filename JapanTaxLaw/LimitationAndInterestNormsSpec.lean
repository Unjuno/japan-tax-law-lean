/-\!
# LimitationAndInterestNormsSpec — 独立形式仕様

pinned 原文（時効・利子割・利子所得 471条片）から独立に読み取った仕様。実装を import しない。

時効は elapsed<=limit、特例期間は base+extension、利子分類は code==0 で利子、
利子割額は base*rate。具体的な期間・金額は NOT MODELLED。
-/
namespace JapanTaxLaw.LimitationAndInterestNormsSpec

def limitationSpec (e l : Nat) : Prop := e <= l
def extendedSpec (b x : Nat) : Nat := b + x
def interestKindSpec (c : Nat) : Nat := if c == 0 then 0 else 1
def splitSpec (b r : Nat) : Nat := b * r

end JapanTaxLaw.LimitationAndInterestNormsSpec
