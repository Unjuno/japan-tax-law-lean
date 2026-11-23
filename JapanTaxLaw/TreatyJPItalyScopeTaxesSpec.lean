/-\!
# TreatyJPItalyScopeTaxesSpec — 独立形式仕様

日伊租税条約 第一条・第二条から独立。実装を import しない。
-/
namespace JapanTaxLaw.TreatyJPItalyScopeTaxesSpec

def inScopeSpec (a b : Bool) : Bool := a || b
def coveredTaxSpec (l s : Bool) : Bool := l || s

end JapanTaxLaw.TreatyJPItalyScopeTaxesSpec
