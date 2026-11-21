/-\!
# RecordAndInterestNormsSpec — 独立形式仕様

pinned 原文（記録・利子計算規範 1188条片）から独立に読み取った仕様。実装を import しない。

記録媒体の提出は記録済みなら書類提出の代替となる。利子は principal*rate*periods、
単利は principal*rate。具体的な記録・利率は呼出側が与える。
-/
namespace JapanTaxLaw.RecordAndInterestNormsSpec

def substituteSpec (r : Bool) : Bool := r
def allRecordedSpec (flags : List Bool) : Bool := flags.all id
def interestSpec (p r n : Nat) : Nat := p * r * n
def simpleSpec (p r : Nat) : Nat := p * r

end JapanTaxLaw.RecordAndInterestNormsSpec
