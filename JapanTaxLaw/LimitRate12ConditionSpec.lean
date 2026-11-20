/-!
# LimitRate12ConditionSpec — 独立形式仕様

pinned 原文「限度税率が百分の十二である場合」から独立に読み取った仕様。
実装を import しない。
-/
namespace JapanTaxLaw.LimitRate12ConditionSpec

/-- 原文の条件: 限度税率（%）が十二に等しい。 -/
def rateIsTwelve (limitRatePercent : Nat) : Prop := limitRatePercent = 12

end JapanTaxLaw.LimitRate12ConditionSpec
