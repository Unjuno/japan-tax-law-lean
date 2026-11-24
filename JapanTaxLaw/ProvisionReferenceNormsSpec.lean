/-\!
# ProvisionReferenceNormsSpec — 独立形式仕様

原文（規定参照）から独立。実装を import しない。
-/
namespace JapanTaxLaw.ProvisionReferenceNormsSpec

abbrev ProvisionIdSpec := Nat
abbrev ResolverSpec := Nat -> Nat
abbrev AmendmentMapSpec := Nat -> Nat

def resolveSpec (r : ResolverSpec) (k : Nat) : ProvisionIdSpec := r k
def resolveAfterAmendmentSpec (r : ResolverSpec) (am : AmendmentMapSpec) (k : Nat) : ProvisionIdSpec :=
  am (r k)

end JapanTaxLaw.ProvisionReferenceNormsSpec
