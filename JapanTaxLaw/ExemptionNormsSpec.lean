/-\!
# ExemptionNormsSpec — 独立形式仕様

原文（免除）から独立。実装を import しない。
-/
namespace JapanTaxLaw.ExemptionNormsSpec

def exemptSpec (liability waived : Nat) : Nat := liability - waived
def composeExemptionsSpec (liability w1 w2 : Nat) : Nat := (liability - w1) - w2

end JapanTaxLaw.ExemptionNormsSpec
