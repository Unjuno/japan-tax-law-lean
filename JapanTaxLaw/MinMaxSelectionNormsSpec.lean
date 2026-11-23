/-\!
# MinMaxSelectionNormsSpec — 独立形式仕様

pinned 原文（最小/最大選択）から独立。実装を import しない。
-/
namespace JapanTaxLaw.MinMaxSelectionNormsSpec

def selectMinSpec (a b : Nat) : Nat := min a b
def selectMaxSpec (a b : Nat) : Nat := max a b

end JapanTaxLaw.MinMaxSelectionNormsSpec
