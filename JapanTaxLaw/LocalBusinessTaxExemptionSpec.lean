/-\!
# LocalBusinessTaxExemptionSpec — 独立形式仕様

地方税法第七十二条の四から独立。実装を import しない。
-/
namespace JapanTaxLaw.LocalBusinessTaxExemptionSpec

def businessTaxExemptSpec (a b c d : Bool) : Bool := a || b || c || d
def mayTaxBusinessSpec (e : Bool) : Bool := !e

end JapanTaxLaw.LocalBusinessTaxExemptionSpec
