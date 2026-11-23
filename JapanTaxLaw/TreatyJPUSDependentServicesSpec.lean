/-\!
# TreatyJPUSDependentServicesSpec — 独立形式仕様

条約第十四条の原文から独立。実装を import しない。
具体的な日数・金額・法的効力は NOT MODELLED。
-/
namespace JapanTaxLaw.TreatyJPUSDependentServicesSpec

def sourceTaxIfWorkThereSpec (w : Bool) : Bool := w
def within183Spec (d : Nat) : Bool := if d <= 183 then true else false
def exemptionConditionsSpec (d : Nat) (e p : Bool) : Bool := (d <= 183) && e && p
def internationalTransportExemptSpec : Bool := true

end JapanTaxLaw.TreatyJPUSDependentServicesSpec
