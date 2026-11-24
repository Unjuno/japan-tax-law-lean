/-\!
# NegativeFactConditionsSpec — 独立形式仕様

原文（「…ないこと。」否定事実条件）から独立。実装を import しない。
-/
namespace JapanTaxLaw.NegativeFactConditionsSpec

def negativeFactSpec (p : Bool) : Bool := !p
def positiveFactSpec (p : Bool) : Bool := p
def anyNegativeSpec (a b : Bool) : Bool := a || b
def allNegativeSpec (a b : Bool) : Bool := a && b

end JapanTaxLaw.NegativeFactConditionsSpec
