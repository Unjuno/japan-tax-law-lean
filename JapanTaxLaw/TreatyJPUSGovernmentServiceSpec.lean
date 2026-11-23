/-\!
# TreatyJPUSGovernmentServiceSpec — 独立形式仕様

条約第十八条の原文から独立。実装を import しない。
具体的な身分・金額・法的効力は NOT MODELLED。
-/
namespace JapanTaxLaw.TreatyJPUSGovernmentServiceSpec

def otherStateOnlyTaxSpec (s t : Bool) : Bool := s && t
def payerStateOnlyTaxSpec (exceptionApplies : Bool) : Bool := !exceptionApplies

end JapanTaxLaw.TreatyJPUSGovernmentServiceSpec
