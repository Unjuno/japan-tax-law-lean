/-\!
# CalculationBasisNormsSpec — 独立形式仕様

原文（計算の基礎）から独立。実装を import しない。
-/
namespace JapanTaxLaw.CalculationBasisNormsSpec

abbrev DerivationSpec := Nat -> Nat

def derivedFromSpec (d : DerivationSpec) (base : Nat) : Nat := d base
def composeDerivationSpec (d1 d2 : DerivationSpec) : DerivationSpec := fun x => d2 (d1 x)
def scaledBaseSpec (base rate : Nat) : Nat := base * rate

end JapanTaxLaw.CalculationBasisNormsSpec
