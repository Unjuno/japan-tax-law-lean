/-\!
# AuthorityDutyNormsSpec — 独立形式仕様

原文（条件的職権義務）から独立。実装を import しない。
-/
namespace JapanTaxLaw.AuthorityDutyNormsSpec

def authorityDutySpec (trigger : Bool) : Bool := trigger
def dutyImpliesActSpec (duty act : Bool) : Bool := !duty || act
def allDutiesSpec (a b : Bool) : Bool := a && b
def noDutySpec (trigger : Bool) : Bool := !trigger

end JapanTaxLaw.AuthorityDutyNormsSpec
