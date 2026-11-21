/-\!
# MiscStructuralTermsSpec — 独立形式仕様

pinned 原文（構造用語 2327条片）から独立に読み取った仕様。実装を import しない。

参照先は外部が与える。施行日以后は enforcement <= date。面積割合は part*100/whole
（whole=0 なら未定義）。用語は構造宣言としてのみ記録。実質内容は NOT MODELLED。
-/
namespace JapanTaxLaw.MiscStructuralTermsSpec

def refSpec (t : Nat) : Nat := t
def temporalSpec (d e : Nat) : Prop := e <= d
def ratioSpec (part whole : Nat) : Option Nat := if whole == 0 then none else some (part * 100 / whole)
def termSpec : Prop := True

end JapanTaxLaw.MiscStructuralTermsSpec
