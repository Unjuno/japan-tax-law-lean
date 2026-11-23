/-\!
# ExclusionRemainderNormsSpec — 独立形式仕様

pinned 原文（除外 6493条片）から独立に読み取った仕様。実装を import しない。

除外は base から exception に含まれる要素を取り除く集合差。具体的なカテゴリは NOT MODELLED。
-/
namespace JapanTaxLaw.ExclusionRemainderNormsSpec

def excludeSpec (base exception : List Nat) : List Nat :=
  base.filter (fun x => decide (x ∉ exception))

end JapanTaxLaw.ExclusionRemainderNormsSpec
