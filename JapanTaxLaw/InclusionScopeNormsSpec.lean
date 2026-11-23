/-\!
# InclusionScopeNormsSpec — 独立形式仕様

pinned 原文（包含「…を含む。」）から独立。実装を import しない。
具体的な包含内容は NOT MODELLED。
-/
namespace JapanTaxLaw.InclusionScopeNormsSpec

def includesSpec (X Y : Nat → Prop) : Prop := ∀ a, Y a → X a

end JapanTaxLaw.InclusionScopeNormsSpec
