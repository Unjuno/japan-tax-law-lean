/-\!
# TreatyJPUSInterestSpec — 独立形式仕様

条約第十一条の原文から独立。実装を import しない。
具体的な金額・関係・法的効力は NOT MODELLED。
-/
namespace JapanTaxLaw.TreatyJPUSInterestSpec

def sourceTaxOnOrdinaryInterestSpec : Bool := false
def contingentInterestCapSpec : Nat := 10
def withinContingentCapSpec (rate : Nat) : Bool := if rate <= 10 then true else false
def excessInterestCapSpec : Nat := 5
def withinExcessCapSpec (rate : Nat) : Bool := if rate <= 5 then true else false
def excessAmountSpec (paid notional : Nat) : Nat := paid - notional

end JapanTaxLaw.TreatyJPUSInterestSpec
