/-\!
# TreatyJPUSBusinessProfitsSpec — 独立形式仕様

条約第七条の原文から独立に読み取った仕様。実装を import しない。
法的効力・具体的事実は NOT MODELLED。
-/
namespace JapanTaxLaw.TreatyJPUSBusinessProfitsSpec

def taxableInOtherSpec (hasPE : Bool) (attributableProfit : Nat) : Bool :=
  hasPE && attributableProfit > 0
def attributedProfitSpec (hypothetical : Nat) : Nat := hypothetical
def merePurchaseAttributionSpec : Nat := 0
def deductibleSpec (forPE : Bool) : Bool := forPE

end JapanTaxLaw.TreatyJPUSBusinessProfitsSpec
