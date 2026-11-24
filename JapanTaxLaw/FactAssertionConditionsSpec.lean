/-\!
# FactAssertionConditionsSpec — 独立形式仕様

原文（「…ること。」事実提示条件）から独立。実装を import しない。
-/
namespace JapanTaxLaw.FactAssertionConditionsSpec

def factAssertionSpec (p : Bool) : Bool := p
def factDenialSpec (p : Bool) : Bool := !p
def anyAssertionSpec (a b : Bool) : Bool := a || b
def allAssertionsSpec (a b : Bool) : Bool := a && b
def assertionImpliesSpec (p q : Bool) : Bool := !p || q

end JapanTaxLaw.FactAssertionConditionsSpec
