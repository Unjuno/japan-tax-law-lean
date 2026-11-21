/-\!
# AnalogyAndReplacementNormsSpec — 独立形式仕様

pinned 原文（準用・適用参照・読替 4639条片）から独立に読み取った仕様。実装を import しない。

準用は A の規定を B に適用（参照先は外部）。読替は字句置換 x==src ? dst : x。
適用参照は条件充足時に規則適用。具体的な規定・字句は NOT MODELLED。
-/
namespace JapanTaxLaw.AnalogyAndReplacementNormsSpec

def analogySpec (t : Nat) : Nat := t
def substituteSpec (x s d : Nat) : Nat := if x == s then d else x
def applySpec (c : Bool) : Bool := c

end JapanTaxLaw.AnalogyAndReplacementNormsSpec
