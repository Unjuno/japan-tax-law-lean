/-\!
# ConditionalTriggerNormsSpec — 独立形式仕様

原文（条件発生「…たとき。」）から独立。実装を import しない。
-/
namespace JapanTaxLaw.ConditionalTriggerNormsSpec

def triggeredSpec (o : Bool) : Bool := o
def anyTriggeredSpec (a b : Bool) : Bool := a || b

end JapanTaxLaw.ConditionalTriggerNormsSpec
