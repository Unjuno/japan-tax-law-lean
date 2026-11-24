/-\!
# DelegatedMannerNormsSpec — 独立形式仕様

原文（委任された方法）から独立。実装を import しない。
-/
namespace JapanTaxLaw.DelegatedMannerNormsSpec

abbrev MannerSpec := Nat -> Nat

def applyDelegatedSpec (manner : MannerSpec) (input : Nat) : Nat := manner input
def composeMannerSpec (m1 m2 : MannerSpec) : MannerSpec := fun x => m2 (m1 x)

end JapanTaxLaw.DelegatedMannerNormsSpec
