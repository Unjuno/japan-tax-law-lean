/-\!
# PriorLawNormsSpec — 独立形式仕様

pinned 原文（従前の例による 6921条片）から独立に読み取った仕様。実装を import しない。

新法は施行日/敷居年以后、旧法はそれ以前（排他的かつ全域的）。「なお従前の例に
よる」は旧法選択。具体的な規定・日付は NOT MODELLED。
-/
namespace JapanTaxLaw.PriorLawNormsSpec

def newSpec (d e : Nat) : Prop := e <= d
def oldSpec (d e : Nat) : Prop := d < e
def yearNewSpec (y t : Nat) : Prop := t <= y
def yearOldSpec (y t : Nat) : Prop := y < t

end JapanTaxLaw.PriorLawNormsSpec
