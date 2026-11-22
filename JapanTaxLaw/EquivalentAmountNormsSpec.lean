/-\!
# EquivalentAmountNormsSpec — 独立形式仕様

pinned 原文（相当する金額 1251条片）から独立に読み取った仕様。実装を import しない。

相当する金額は対応する base value と同一視される（恒等）。具体的な base 値は NOT MODELLED。
-/
namespace JapanTaxLaw.EquivalentAmountNormsSpec

def equivalentSpec (base : Nat) : Nat := base

end JapanTaxLaw.EquivalentAmountNormsSpec
