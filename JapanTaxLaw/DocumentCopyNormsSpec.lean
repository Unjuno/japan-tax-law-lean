/-\!
# DocumentCopyNormsSpec — 独立形式仕様

原文（書類の写し）から独立。実装を import しない。
-/
namespace JapanTaxLaw.DocumentCopyNormsSpec

def copyRequirementSpec (submitted matchesOriginal : Bool) : Bool := submitted && matchesOriginal
def copyOfSpec (orig : Nat) : Nat := orig
def allCopiesSpec (a b : Bool) : Bool := a && b

end JapanTaxLaw.DocumentCopyNormsSpec
