/-\!
# TreatyJPUSResidentDefinitionSpec — 独立形式仕様

条約第四条１・２から独立。実装を import しない。
-/
namespace JapanTaxLaw.TreatyJPUSResidentDefinitionSpec

def isResidentSpec (w : Bool) : Bool := w
def usResidentSpec (a b c : Bool) : Bool := a && b && c

end JapanTaxLaw.TreatyJPUSResidentDefinitionSpec
