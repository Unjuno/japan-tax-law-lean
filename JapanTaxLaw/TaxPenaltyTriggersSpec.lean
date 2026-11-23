/-\!
# TaxPenaltyTriggersSpec — 独立形式仕様

pinned 原文（地方税法 罰則要件）から独立。実装を import しない。
-/
namespace JapanTaxLaw.TaxPenaltyTriggersSpec

def inspectionObstructionSpec (r o e : Bool) : Bool := r || o || e
def falseAnswerSpec (n u : Bool) : Bool := n || u
def booksViolationSpec (a b c d : Bool) : Bool := a || b || c || d
def penaltyAppliesSpec (o a r b : Bool) : Bool := o || a || r || b

end JapanTaxLaw.TaxPenaltyTriggersSpec
