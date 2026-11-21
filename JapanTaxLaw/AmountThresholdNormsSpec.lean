/-\!
# AmountThresholdNormsSpec — 独立形式仕様

pinned 原文（金額閾値 914条片）から独立に読み取った仕様。実装を import しない。

金額以下は amount<=threshold、超は threshold<amount、所得バンドは lo<=income<=hi、
人数倍限度額は threshold*count。具体的な金額は NOT MODELLED。
-/
namespace JapanTaxLaw.AmountThresholdNormsSpec

def atMostSpec (a t : Nat) : Prop := a <= t
def exceedsSpec (a t : Nat) : Prop := t < a
def bandSpec (i lo hi : Nat) : Prop := lo <= i ∧ i <= hi
def limitCountSpec (t c : Nat) : Nat := t * c

end JapanTaxLaw.AmountThresholdNormsSpec
