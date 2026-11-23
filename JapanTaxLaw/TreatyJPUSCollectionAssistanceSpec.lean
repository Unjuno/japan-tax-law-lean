/-\!
# TreatyJPUSCollectionAssistanceSpec — 独立形式仕様

条約第二十七条から独立。実装を import しない。
-/
namespace JapanTaxLaw.TreatyJPUSCollectionAssistanceSpec

def mayAssistSpec (p : Bool) : Bool := p
def notLimitedByScopeSpec : Bool := true
def assistanceEligibleSpec (e p : Bool) : Bool := e && p

end JapanTaxLaw.TreatyJPUSCollectionAssistanceSpec
