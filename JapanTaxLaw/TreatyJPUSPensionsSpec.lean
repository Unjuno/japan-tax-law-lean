/-\!
# TreatyJPUSPensionsSpec — 独立形式仕様

条約第十七条の原文から独立。実装を import しない。
具体的な金額・支払・法的効力は NOT MODELLED。
-/
namespace JapanTaxLaw.TreatyJPUSPensionsSpec

def sourceTaxOnPensionSpec : Bool := false
def alimonyTaxableSpec (deductible : Bool) : Nat := if deductible then 1 else 0
def payerStateTaxesSpec (deductible : Bool) : Bool := deductible

end JapanTaxLaw.TreatyJPUSPensionsSpec
