/-\!
# DeemingAndProvisoNormsSpec — 独立形式仕様

pinned 原文（擬制とただし書例外 4115条片）から独立に読み取った仕様。実装を import しない。

擬制は X を Y として扱い範囲を realX || deemedX に拡張。ただし書は例外成立時に
規則を無効化 rule && !exception。具体的条件は呼出側が与える。
-/
namespace JapanTaxLaw.DeemingAndProvisoNormsSpec

def deemSpec (isX : Bool) : Bool := isX
def deemExtendSpec (real deemed : Bool) : Bool := real || deemed
def ruleExceptionSpec (rule ex : Bool) : Bool := rule && !ex

end JapanTaxLaw.DeemingAndProvisoNormsSpec
