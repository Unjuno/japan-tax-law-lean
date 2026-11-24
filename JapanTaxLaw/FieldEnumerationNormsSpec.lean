/-\!
# FieldEnumerationNormsSpec — 独立形式仕様

原文（記載事項の列挙）から独立。実装を import しない。
-/
namespace JapanTaxLaw.FieldEnumerationNormsSpec

abbrev FormSpec := List Bool

def completeSpec (f : FormSpec) : Bool := f.all id
def combineFormsSpec (a b : FormSpec) : FormSpec := a ++ b
def addFieldSpec (f : FormSpec) (filled : Bool) : FormSpec := f ++ [filled]

end JapanTaxLaw.FieldEnumerationNormsSpec
