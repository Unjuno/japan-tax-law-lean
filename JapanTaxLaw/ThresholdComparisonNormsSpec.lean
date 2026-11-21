/-\!
# ThresholdComparisonNormsSpec — 独立形式仕様

pinned 原文（閾値比較 990条片）から独立に読み取った仕様。実装を import しない。

超過は threshold < value、超過部分は value - threshold、バンドは lo < value <= hi。
具体的な金額は呼出側が与える。
-/
namespace JapanTaxLaw.ThresholdComparisonNormsSpec

def exceedsSpec (v t : Nat) : Prop := t < v
def excessSpec (v t : Nat) : Nat := v - t
def bandSpec (v lo hi : Nat) : Prop := lo < v ∧ v <= hi
def atMostSpec (v t : Nat) : Prop := v <= t
def atLeastSpec (v t : Nat) : Prop := t <= v
def belowSpec (v t : Nat) : Prop := v < t

end JapanTaxLaw.ThresholdComparisonNormsSpec
