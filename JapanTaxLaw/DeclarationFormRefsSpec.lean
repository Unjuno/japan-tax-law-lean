/-\!
# DeclarationFormRefsSpec — 独立形式仕様

原文（申告書の参照）から独立。実装を import しない。
-/
namespace JapanTaxLaw.DeclarationFormRefsSpec

abbrev FormResolverSpec := Nat -> Nat

def declarationFormSpec (r : FormResolverSpec) (k : Nat) : Nat := r k
def distinctKeysSpec (k1 k2 : Nat) : Bool := k1 != k2

end JapanTaxLaw.DeclarationFormRefsSpec
