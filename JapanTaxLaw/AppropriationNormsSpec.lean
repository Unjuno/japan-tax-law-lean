/-\!
# AppropriationNormsSpec — 独立形式仕様

原文（充当）から独立。実装を import しない。
-/
namespace JapanTaxLaw.AppropriationNormsSpec

def appropriateSpec (liability applied : Nat) : Nat := liability - applied
def totalAppliedSpec (a b : Nat) : Nat := a + b

end JapanTaxLaw.AppropriationNormsSpec
