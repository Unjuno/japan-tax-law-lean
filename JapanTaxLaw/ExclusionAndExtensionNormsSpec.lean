/-\!
# ExclusionAndExtensionNormsSpec — 独立形式仕様

pinned 原文（適用除外・期間延長 1075条片）から独立に読み取った仕様。実装を import しない。

適用除外は条件成立時に規則を無効化 (!condition)、複数条件は OR。期間延長は
original + min(extension, cap)。具体的な条件・期間は呼出側が与える。
-/
namespace JapanTaxLaw.ExclusionAndExtensionNormsSpec

def exclusionSpec (c : Bool) : Bool := !c
def anySpec (flags : List Bool) : Bool := flags.any id
def extendSpec (o e c : Nat) : Nat := o + (if e <= c then e else c)

end JapanTaxLaw.ExclusionAndExtensionNormsSpec
