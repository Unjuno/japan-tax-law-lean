/-\!
# RoundingBoundaryOperatorsSpec — 独立形式仕様

pinned 原文（端数処理 94条片）から独立に読み取った仕様。実装を import しない。

切り捨て x/unit*unit、四捨五入 (x+unit/2)/unit*unit、切り上げ (x+unit-1)/unit*unit。
具体的な金額・単位は NOT MODELLED。
-/
namespace JapanTaxLaw.RoundingBoundaryOperatorsSpec

def downSpec (x unit : Nat) : Nat := x / unit * unit
def halfSpec (x unit : Nat) : Nat := (x + unit / 2) / unit * unit
def upSpec (x unit : Nat) : Nat := (x + unit - 1) / unit * unit

end JapanTaxLaw.RoundingBoundaryOperatorsSpec
