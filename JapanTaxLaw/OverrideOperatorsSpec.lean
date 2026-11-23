/-\!
# OverrideOperatorsSpec — 独立形式仕様

pinned 原文（規定にかかわらず 406条片）から独立に読み取った仕様。実装を import しない。

優先適用は conflict の値に依存せず effect を返す。具体的な効果・条項は NOT MODELLED。
-/
namespace JapanTaxLaw.OverrideOperatorsSpec

def overrideSpec (conflict : Bool) (effect : Nat) : Nat :=
  if conflict then effect else effect

end JapanTaxLaw.OverrideOperatorsSpec
