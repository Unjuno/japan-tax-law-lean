/-\!
# TreatyJPUSDividendsSpec — 独立形式仕様

条約第十条の原文から独立。実装を import しない。
具体的な所有割合・金額・法的効力は NOT MODELLED。
-/
namespace JapanTaxLaw.TreatyJPUSDividendsSpec

def dividendRateCapSpec (p : Nat) : Nat := if 10 <= p then 5 else 10
def withinCapSpec (rate cap : Nat) : Bool := if rate <= cap then true else false
def exemptInSourceSpec (p : Nat) (pf : Bool) : Bool := (50 <= p) || pf
def appliesRateRulesSpec (isRIC : Bool) : Bool := !isRIC

end JapanTaxLaw.TreatyJPUSDividendsSpec
