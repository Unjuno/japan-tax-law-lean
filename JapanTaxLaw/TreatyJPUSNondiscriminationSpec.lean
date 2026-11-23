/-\!
# TreatyJPUSNondiscriminationSpec — 独立形式仕様

条約第二十四条から独立。実装を import しない。
-/
namespace JapanTaxLaw.TreatyJPUSNondiscriminationSpec

def notMoreBurdensomeSpec (f d : Nat) : Bool := if f <= d then true else false
def coveredByNondiscriminationSpec (n p : Bool) : Bool := n || p

end JapanTaxLaw.TreatyJPUSNondiscriminationSpec
