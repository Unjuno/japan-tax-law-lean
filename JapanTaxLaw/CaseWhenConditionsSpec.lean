/-\!
# CaseWhenConditionsSpec — 独立形式仕様

原文（「…する場合」場合条件）から独立。実装を import しない。
-/
namespace JapanTaxLaw.CaseWhenConditionsSpec

def caseConditionSpec (p : Bool) : Bool := p
def noCaseConditionSpec (p : Bool) : Bool := !p
def anyCaseSpec (a b : Bool) : Bool := a || b
def allCasesSpec (a b : Bool) : Bool := a && b

end JapanTaxLaw.CaseWhenConditionsSpec
