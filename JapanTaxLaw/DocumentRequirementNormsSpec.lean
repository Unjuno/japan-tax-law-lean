/-\!
# DocumentRequirementNormsSpec — 独立形式仕様

原文（書類要件）から独立。実装を import しない。
-/
namespace JapanTaxLaw.DocumentRequirementNormsSpec

def docRequirementSpec (present complete : Bool) : Bool := present && complete
def submissionFulfilledSpec (submitted : Bool) : Bool := submitted
def allRequirementsSpec (a b : Bool) : Bool := a && b
def requirementImpliesSpec (a b : Bool) : Bool := !a || b

end JapanTaxLaw.DocumentRequirementNormsSpec
