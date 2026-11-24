/-\!
# PastEventCaseNormsSpec — 独立形式仕様

原文（過去事象の場合）から独立。実装を import しない。
-/
namespace JapanTaxLaw.PastEventCaseNormsSpec

def pastEventCaseSpec (p : Bool) : Bool := p
def noPastEventSpec (p : Bool) : Bool := !p
def anyPastEventSpec (a b : Bool) : Bool := a || b
def allPastEventsSpec (a b : Bool) : Bool := a && b

end JapanTaxLaw.PastEventCaseNormsSpec
