/-!
# ForestEnvironmentTaxRateSpec — 独立形式仕様

pinned 原文「森林環境税の税率は、千円とする。」から独立に読み取った仕様。
実装を import しない。
-/
namespace JapanTaxLaw.ForestEnvironmentTaxRateSpec

/-- 原文の税率（円）。 -/
def statutoryRateYen : Nat := 1_000

/-- 原文の法的効果: 税率が千円に等しい。 -/
def rateIsStatutory (amountYen : Nat) : Prop := amountYen = 1_000

end JapanTaxLaw.ForestEnvironmentTaxRateSpec
