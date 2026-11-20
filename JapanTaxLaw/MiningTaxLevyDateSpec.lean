/-!
# MiningTaxLevyDateSpec — 独立形式仕様

pinned 原文から独立に読み取った仕様。実装を import しない。
-/
namespace JapanTaxLaw.MiningTaxLevyDateSpec

/-- 原文の賦課期日（4月1日）。 -/
def statutoryLevyDate (month : Nat) (day : Nat) : Prop :=
  month = 4 ∧ day = 1

end JapanTaxLaw.MiningTaxLevyDateSpec
