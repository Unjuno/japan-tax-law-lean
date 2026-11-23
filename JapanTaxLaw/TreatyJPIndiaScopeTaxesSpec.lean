/-!
# TreatyJPIndiaScopeTaxesSpec — 独立形式仕様
-/
namespace JapanTaxLaw.TreatyJPIndiaScopeTaxesSpec

def inScopeSpec (a b : Bool) : Bool := a || b
def coveredTaxSpec (l s : Bool) : Bool := l || s

end JapanTaxLaw.TreatyJPIndiaScopeTaxesSpec
