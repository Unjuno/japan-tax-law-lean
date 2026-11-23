/-\!
# TreatyJPUSPermanentEstablishmentSpec — 独立形式仕様

条約第五条から独立。実装を import しない。
-/
namespace JapanTaxLaw.TreatyJPUSPermanentEstablishmentSpec

def constructionPESpec (m : Nat) : Bool := if 12 < m then true else false
def preparatoryActivityIsPESpec (p : Bool) : Bool := false
def agencyPESpec (a r n : Bool) : Bool := a && r && n
def independentAgentPESpec : Bool := false
def controlCreatesPESpec : Bool := false

end JapanTaxLaw.TreatyJPUSPermanentEstablishmentSpec
