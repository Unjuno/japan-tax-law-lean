/-\!
# AmountSettingNormsSpec — 独立形式仕様

原文（「…額とする。」額設定）から独立。実装を import しない。
金額を Nat とする。
-/
namespace JapanTaxLaw.AmountSettingNormsSpec

abbrev AmountSpec := Nat

def setWithAdditionSpec (base addition : AmountSpec) : AmountSpec := base + addition
def setWithDeductionSpec (base deduction : AmountSpec) : AmountSpec := base - deduction
def setComputedSpec (computed : AmountSpec) : AmountSpec := computed
def addThenDeductSpec (base addition deduction : AmountSpec) : AmountSpec :=
  setWithDeductionSpec (setWithAdditionSpec base addition) deduction

end JapanTaxLaw.AmountSettingNormsSpec
