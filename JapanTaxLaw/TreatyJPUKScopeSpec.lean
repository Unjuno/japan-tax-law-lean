/-\!
# TreatyJPUKScopeSpec — 独立形式仕様

日英租税条約 第一条・第三条１ から独立。実装を import しない。
-/
namespace JapanTaxLaw.TreatyJPUKScopeSpec

def inScopeSpec (a b : Bool) : Bool := a || b
def fiscallyTransparentAttributionSpec (f t : Bool) : Bool := f && t

end JapanTaxLaw.TreatyJPUKScopeSpec
