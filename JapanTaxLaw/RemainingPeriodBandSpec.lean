/-!
# RemainingPeriodBandSpec — 独立形式仕様

pinned 原文から独立に読み取った仕様。実装を import しない。
-/
namespace JapanTaxLaw.RemainingPeriodBandSpec

/-- 原文の残存期間の帯: 10年 < y <= 15年。 -/
def inRemainingPeriod (years : Nat) : Prop :=
  10 < years ∧ years <= 15

end JapanTaxLaw.RemainingPeriodBandSpec
