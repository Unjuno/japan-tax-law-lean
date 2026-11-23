/-\!
# CapComparisonNormsSpec — 独立形式仕様

pinned 原文（を超えない 107条片）から独立に読み取った仕様。実装を import しない。

上限比較は value <= cap の場合のみ真。具体的な値・上限は NOT MODELLED。
-/
namespace JapanTaxLaw.CapComparisonNormsSpec

def capSpec (value cap : Nat) : Bool := if value <= cap then true else false

end JapanTaxLaw.CapComparisonNormsSpec
