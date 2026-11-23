/-\!
# TreatyJPUSInfoExchangeSpec — 独立形式仕様

条約第二十六条から独立。実装を import しない。
-/
namespace JapanTaxLaw.TreatyJPUSInfoExchangeSpec

def exchangeUnboundedSpec : Bool := true
def mayDiscloseSpec (p : Bool) : Bool := p
def noDutyToProvideSpec (obtainable : Bool) : Bool := !obtainable

end JapanTaxLaw.TreatyJPUSInfoExchangeSpec
