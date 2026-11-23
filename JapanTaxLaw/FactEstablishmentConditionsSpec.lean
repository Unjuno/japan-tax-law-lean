/-\!
# FactEstablishmentConditionsSpec — 独立形式仕様

原文（「…たこと。」事実確定条件）から独立。実装を import しない。
-/
namespace JapanTaxLaw.FactEstablishmentConditionsSpec

def factEstablishedSpec (p : Bool) : Bool := p
def factNotEstablishedSpec (p : Bool) : Bool := !p
def anyFactSpec (a b : Bool) : Bool := a || b
def allFactsSpec (a b : Bool) : Bool := a && b

end JapanTaxLaw.FactEstablishmentConditionsSpec
