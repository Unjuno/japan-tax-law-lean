/-\!
# TreatyJPUSLimitationOnBenefitsSpec — 独立形式仕様

条約第二十二条から独立。実装を import しない。
-/
namespace JapanTaxLaw.TreatyJPUSLimitationOnBenefitsSpec

def isQualifyingCategorySpec (a b c d e f g : Bool) : Bool := a || b || c || d || e || f || g
def treatyEligibleSpec (m q s : Bool) : Bool := s || (m && q)

end JapanTaxLaw.TreatyJPUSLimitationOnBenefitsSpec
