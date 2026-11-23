/-\!
# TreatyJPUSImmovableSpec — 独立形式仕様

L3 別層。原文（第六条）から独立。具体的な州・財産種別は NOT MODELLED。
-/
namespace JapanTaxLaw.TreatyJPUSImmovableSpec

def sourceTaxSpec (p r : Nat) : Bool := p != r
def immovableSpec (k : Nat) (ks : List Nat) : Bool := k ∈ ks

end JapanTaxLaw.TreatyJPUSImmovableSpec
