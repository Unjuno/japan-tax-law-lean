/-\!
# ConditionStateNormsSpec — 独立形式仕様

原文（「…ある場合」/「…ない場合」）から独立。実装を import しない。
-/
namespace JapanTaxLaw.ConditionStateNormsSpec

def posConditionSpec (x : Bool) : Bool := x
def negConditionSpec (x : Bool) : Bool := !x

end JapanTaxLaw.ConditionStateNormsSpec
