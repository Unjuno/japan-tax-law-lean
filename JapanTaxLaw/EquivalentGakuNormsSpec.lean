/-\!
# EquivalentGakuNormsSpec — 独立形式仕様

pinned 原文（相当する額 261条片）から独立に読み取った仕様。実装を import しない。

相当する額は対応する base value と同一視される（恒等）。具体的な base 値は NOT MODELLED。
-/
namespace JapanTaxLaw.EquivalentGakuNormsSpec

def equivalentGakuSpec (base : Nat) : Nat := base

end JapanTaxLaw.EquivalentGakuNormsSpec
