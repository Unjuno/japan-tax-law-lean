/-\!
# SameLawRefNormsSpec — 独立形式仕様

原文（同法参照）から独立。実装を import しない。
-/
namespace JapanTaxLaw.SameLawRefNormsSpec

abbrev LawResolverSpec := Nat -> Nat

def sameLawSpec (r : LawResolverSpec) (ref : Nat) : Nat := r ref
def chainRefSpec (r : LawResolverSpec) (ref1 ref2 : Nat) : Nat := r (r ref1 + ref2)

end JapanTaxLaw.SameLawRefNormsSpec
