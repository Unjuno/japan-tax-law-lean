/-\!
# TreatyJPUSRoyaltiesSpec — 独立形式仕様

条約第十二条の原文から独立。実装を import しない。
具体的な金額・権利・法的効力は NOT MODELLED。
-/
namespace JapanTaxLaw.TreatyJPUSRoyaltiesSpec

def sourceTaxOnOrdinaryRoyaltySpec : Bool := false
def article7AppliesSpec (pe link : Bool) : Bool := pe && link
def royaltyExcessCapSpec : Nat := 5
def withinRoyaltyExcessCapSpec (rate : Nat) : Bool := if rate <= 5 then true else false
def royaltyExcessSpec (paid notional : Nat) : Nat := paid - notional

end JapanTaxLaw.TreatyJPUSRoyaltiesSpec
