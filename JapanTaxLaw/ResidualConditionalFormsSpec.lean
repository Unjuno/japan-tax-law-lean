/-\!
# ResidualConditionalFormsSpec — 独立形式仕様

原文（残余の条件形式）から独立。実装を import しない。
-/
namespace JapanTaxLaw.ResidualConditionalFormsSpec

def passiveEventSpec (p : Bool) : Bool := p
def existenceStateSpec (p : Bool) : Bool := p
def agentiveActSpec (p : Bool) : Bool := p
def qualityTimeSpec (p : Bool) : Bool := p
def itemCaseSpec (p : Bool) : Bool := p
def prescriptiveActSpec (p : Bool) : Bool := p
def condNotSpec (p : Bool) : Bool := !p
def anyCondSpec (a b : Bool) : Bool := a || b

end JapanTaxLaw.ResidualConditionalFormsSpec
