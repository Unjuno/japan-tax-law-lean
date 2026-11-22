/-\!
# ClampOperatorsSpec — 独立形式仕様

pinned 原文（下限・上限クランプ 52条片）から独立に読み取った仕様。実装を import しない。

負数→0、下限は max(x,floor)、上限は min(x,cap)。具体的な入力値は NOT MODELLED。
-/
namespace JapanTaxLaw.ClampOperatorsSpec

def clampNonNegSpec (x : Int) : Nat := if x < 0 then 0 else Int.toNat x
def clampFloorSpec (x f : Int) : Int := max x f
def clampCapSpec (x c : Int) : Int := min x c

end JapanTaxLaw.ClampOperatorsSpec
