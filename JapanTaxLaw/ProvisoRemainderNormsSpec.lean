/-\!
# ProvisoRemainderNormsSpec — 独立形式仕様

pinned 原文（ただし書 1484条片）から独立に読み取った仕様。実装を import しない。

ただし書は condition が真なら例外効果、偽なら基本効果。具体的条件・効果は NOT MODELLED。
-/
namespace JapanTaxLaw.ProvisoRemainderNormsSpec

def provisoSpec (condition : Bool) (base exception : Nat) : Nat :=
  if condition then exception else base

end JapanTaxLaw.ProvisoRemainderNormsSpec
