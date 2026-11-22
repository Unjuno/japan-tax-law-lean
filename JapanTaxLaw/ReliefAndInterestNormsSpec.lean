/-\!
# ReliefAndInterestNormsSpec — 独立形式仕様

pinned 原文（還付加算金・軽減免除・無税 212条片）から独立に読み取った仕様。実装を import しない。

遅い日は max(a,b)、還付加算金は principal*rate*years、軽減/免除の取り戻しは OR、
無税は税額 0。具体的な日付・金額は NOT MODELLED。
-/
namespace JapanTaxLaw.ReliefAndInterestNormsSpec

def laterSpec (a b : Nat) : Nat := if a <= b then b else a
def interestSpec (p r y : Nat) : Nat := p * r * y
def recoverSpec (r e : Bool) : Bool := r || e
def zeroSpec (a : Nat) : Nat := 0

end JapanTaxLaw.ReliefAndInterestNormsSpec
