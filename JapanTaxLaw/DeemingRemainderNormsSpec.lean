/-\!
# DeemingRemainderNormsSpec — 独立形式仕様

pinned 原文（みなす 374条片）から独立に読み取った仕様。実装を import しない。

みなすは target として読替える演算子。適用場面が一致するときのみ効く。
具体的な subject/target/context は NOT MODELLED。
-/
namespace JapanTaxLaw.DeemingRemainderNormsSpec

def deemSpec (subject target : Nat) : Nat := target

def deemForSpec (ctx useCtx subject target : Nat) : Nat :=
  if ctx = useCtx then target else subject

end JapanTaxLaw.DeemingRemainderNormsSpec
