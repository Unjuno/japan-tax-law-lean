/-\!
# EnumRefsAndOperatorsSpec — 独立形式仕様

pinned 原文（範囲列挙・同条項参照・百円未満切捨て・合算 1175条片）から独立に
読み取った仕様。実装を import しない。

範囲列挙: lo <= x <= hi、または明示列挙された値のみ。同条項参照: 参照先は外部が与える。
切捨て: 100の倍数で x 以下最大の値。合算: 各号の額の総和。
参照先・金額・列挙項目の実内容は NOT MODELLED。
-/
namespace JapanTaxLaw.EnumRefsAndOperatorsSpec

def rangeSpec (lo hi x : Nat) : Prop := lo <= x ∧ x <= hi
def enumSpec (xs : List Nat) (x : Nat) : Prop := x ∈ xs
def refSpec (target : Nat) : Nat := target
def roundDownSpec (x : Nat) : Nat := x - x % 100
def sumSpec (xs : List Nat) : Nat := xs.sum

end JapanTaxLaw.EnumRefsAndOperatorsSpec
