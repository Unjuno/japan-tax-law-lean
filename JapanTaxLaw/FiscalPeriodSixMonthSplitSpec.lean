/-!
# FiscalPeriodSixMonthSplitSpec — 独立形式仕様

pinned 原文A/B から独立に読み取った仕様。実装を import しない。
-/
namespace JapanTaxLaw.FiscalPeriodSixMonthSplitSpec

/-- 原文A: 六月に満たない。 -/
def underSpec (months : Nat) : Prop := months < 6

/-- 原文B: 六月以上。 -/
def moreSpec (months : Nat) : Prop := 6 <= months

end JapanTaxLaw.FiscalPeriodSixMonthSplitSpec
