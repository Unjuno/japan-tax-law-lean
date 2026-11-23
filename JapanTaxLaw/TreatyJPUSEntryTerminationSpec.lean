/-\!
# TreatyJPUSEntryTerminationSpec — 独立形式仕様

条約第三十条・第三十一条から独立。実装を import しない。
-/
namespace JapanTaxLaw.TreatyJPUSEntryTerminationSpec

def withholdingStartMonthSpec (early : Bool) : Nat := if early then 7 else 1
def terminationAllowedSpec (y : Nat) : Bool := if 5 <= y then true else false
def validNoticeSpec (m : Nat) : Bool := if 6 <= m then true else false
def canTerminateSpec (y n : Bool) : Bool := y && n

end JapanTaxLaw.TreatyJPUSEntryTerminationSpec
