/-\!
# NegativeOperationNormsSpec — 独立形式仕様

原文（否定操作）から独立。実装を import しない。
-/
namespace JapanTaxLaw.NegativeOperationNormsSpec

def positiveOpSpec (p : Bool) : Bool := p
def negativeOpSpec (p : Bool) : Bool := !p
def allNegativeSpec (a b : Bool) : Bool := a && b

end JapanTaxLaw.NegativeOperationNormsSpec
