/-\!
# RestrictionNormsSpec — 独立形式仕様

pinned 原文（に限る）から独立に読み取った仕様。実装を import しない。

限定は candidate と allowed が等しい場合のみ真。具体的な値は NOT MODELLED。
-/
namespace JapanTaxLaw.RestrictionNormsSpec

def restrictSpec (candidate allowed : Nat) : Bool := if candidate = allowed then true else false

end JapanTaxLaw.RestrictionNormsSpec
