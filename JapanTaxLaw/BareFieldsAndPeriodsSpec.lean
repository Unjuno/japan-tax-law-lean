/-\!
# BareFieldsAndPeriodsSpec — 独立形式仕様

pinned 原文（申請欄・期間・数値・列挙導入 7219条片）から独立に読み取った仕様。
実装を import しない。

参照先は外部が与える。期間/数値レンジは [lo,hi]、最小選択は min、公布日起算の
窓は date<=bound。欄・導入文は構造宣言としてのみ記録。実質内容は NOT MODELLED。
-/
namespace JapanTaxLaw.BareFieldsAndPeriodsSpec

def refSpec (t : Nat) : Nat := t
def periodSpec (d lo hi : Nat) : Prop := lo <= d ∧ d <= hi
def rangeSpec (x lo hi : Nat) : Prop := lo <= x ∧ x <= hi
def minSpec (a b : Nat) : Nat := if a <= b then a else b
def windowSpec (d b : Nat) : Prop := d <= b
def declarationSpec : Prop := True

end JapanTaxLaw.BareFieldsAndPeriodsSpec
