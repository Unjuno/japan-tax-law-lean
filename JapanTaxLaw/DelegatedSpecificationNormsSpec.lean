/-\!
# DelegatedSpecificationNormsSpec — 独立形式仕様

原文（委任事項の特定）から独立。実装を import しない。
-/
namespace JapanTaxLaw.DelegatedSpecificationNormsSpec

def specifiedAsSpec (r : Nat -> Nat) (t : Nat) : Nat := r t
def specEquivSpec (r : Nat -> Nat) (a b : Nat) : Bool := (r a) == (r b)

end JapanTaxLaw.DelegatedSpecificationNormsSpec
