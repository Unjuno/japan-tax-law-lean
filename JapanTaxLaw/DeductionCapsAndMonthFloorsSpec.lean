/-!
# DeductionCapsAndMonthFloorsSpec — 独立形式仕様

pinned 原文（325AC0000000226 art.72_21 月数下限、art.37の2 / art.314の7 控除上限）
から独立に読み取った仕様。実装を import しない。
-/
namespace JapanTaxLaw.DeductionCapsAndMonthFloorsSpec

/-- 一月に満たないときは一月（下限 1）。 -/
def monthFloorSpec (m : Nat) : Nat := if m = 0 then 1 else m

/-- 控除額が所得割の額を超えるときは所得割の額（上限）。 -/
def deductionCapSpec (deduction liability : Nat) : Nat :=
  if liability <= deduction then liability else deduction

end JapanTaxLaw.DeductionCapsAndMonthFloorsSpec
