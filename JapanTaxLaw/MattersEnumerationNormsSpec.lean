/-\!
# MattersEnumerationNormsSpec — 独立形式仕様

原文（事項の列挙）から独立。実装を import しない。
-/
namespace JapanTaxLaw.MattersEnumerationNormsSpec

abbrev MatterListSpec := List Bool

def completeSpec (f : MatterListSpec) : Bool := f.all id
def combineMattersSpec (a b : MatterListSpec) : MatterListSpec := a ++ b
def addMatterSpec (f : MatterListSpec) (filled : Bool) : MatterListSpec := f ++ [filled]

end JapanTaxLaw.MattersEnumerationNormsSpec
