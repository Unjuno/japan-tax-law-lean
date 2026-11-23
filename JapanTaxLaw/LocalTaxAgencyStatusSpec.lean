/-\!
# LocalTaxAgencyStatusSpec — 独立形式仕様

地方税法第七百六十三条から独立。実装を import しない。
-/
namespace JapanTaxLaw.LocalTaxAgencyStatusSpec

def isJuridicalPersonSpec : Bool := true
def deemedDomicileSpec (h : Bool) : Bool := h

end JapanTaxLaw.LocalTaxAgencyStatusSpec
