/-\!
# TreatyJPUSDiplomaticAndConsultationSpec — 独立形式仕様

条約第二十八条・第二十九条から独立。実装を import しない。
-/
namespace JapanTaxLaw.TreatyJPUSDiplomaticAndConsultationSpec

def diplomaticPrivilegesPreservedSpec : Bool := true
def consultationRequestedSpec (c : Bool) : Bool := c
def withinThreeMonthsSpec (m : Nat) : Bool := if m <= 3 then true else false

end JapanTaxLaw.TreatyJPUSDiplomaticAndConsultationSpec
