/-\!
# LocalSecondaryTaxLiabilitySpec — 独立形式仕様

地方税法第十一条の六から独立。実装を import しない。
-/
namespace JapanTaxLaw.LocalSecondaryTaxLiabilitySpec

def secondaryLiabilitySpec (p i d s c1 c2 : Bool) : Bool :=
  p && i && d && s && (c1 || c2)

end JapanTaxLaw.LocalSecondaryTaxLiabilitySpec
