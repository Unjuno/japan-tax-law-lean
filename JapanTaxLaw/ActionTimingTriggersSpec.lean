/-\!
# ActionTimingTriggersSpec — 独立形式仕様

原文（「…るとき。」行為時機トリガー）から独立。実装を import しない。
-/
namespace JapanTaxLaw.ActionTimingTriggersSpec

def timingConditionSpec (p : Bool) : Bool := p
def notTimingConditionSpec (p : Bool) : Bool := !p
def anyTimingSpec (a b : Bool) : Bool := a || b
def timingImpliesSpec (p q : Bool) : Bool := !p || q

end JapanTaxLaw.ActionTimingTriggersSpec
