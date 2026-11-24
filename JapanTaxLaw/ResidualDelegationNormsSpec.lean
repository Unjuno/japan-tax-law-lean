/-\!
# ResidualDelegationNormsSpec — 独立形式仕様

原文（残余事項の委任）から独立。実装を import しない。
-/
namespace JapanTaxLaw.ResidualDelegationNormsSpec

abbrev EnumeratedSpec := Nat -> Bool

def residualSpec (e : EnumeratedSpec) (m : Nat) : Bool := !e m
def extendEnumSpec (e1 e2 : EnumeratedSpec) : EnumeratedSpec := fun m => e1 m || e2 m

end JapanTaxLaw.ResidualDelegationNormsSpec
