/-\!
# TemporalConditionNormsSpec — 独立形式仕様

原文（完了・未完了・該当・存在条件）から独立。実装を import しない。
-/
namespace JapanTaxLaw.TemporalConditionNormsSpec

def completionConditionSpec (p : Bool) : Bool := p
def nonCompletionConditionSpec (p : Bool) : Bool := !p
def applicabilityConditionSpec (p : Bool) : Bool := p
def existenceConditionSpec (p : Bool) : Bool := p

end JapanTaxLaw.TemporalConditionNormsSpec
