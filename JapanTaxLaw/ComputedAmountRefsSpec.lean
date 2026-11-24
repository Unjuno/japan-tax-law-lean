/-\!
# ComputedAmountRefsSpec — 独立形式仕様

原文（算定額の参照）から独立。実装を import しない。
-/
namespace JapanTaxLaw.ComputedAmountRefsSpec

abbrev AmountSpec := Nat
abbrev MethodSpec := Nat -> Nat

def computedAmountSpec (base : AmountSpec) (method : MethodSpec) : AmountSpec := method base
def prescribedAmountSpec (v : AmountSpec) : AmountSpec := v
def composeMethodsSpec (m1 m2 : MethodSpec) : MethodSpec := fun x => m2 (m1 x)

end JapanTaxLaw.ComputedAmountRefsSpec
