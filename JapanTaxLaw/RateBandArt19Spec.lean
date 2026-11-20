/-!
# RateBandArt19Spec — 独立形式仕様

pinned 原文「千万円以上千五百万円未満の金額」から独立に読み取った仕様。
実装モジュールを import しない。境界の包含/排除を明示する。
-/
namespace JapanTaxLaw.RateBandArt19Spec

/-- 原文の金額帯（円）。下限以上・上限未満。 -/
def band (amount : Nat) : Prop :=
  10_000_000 <= amount ∧ amount < 15_000_000

end JapanTaxLaw.RateBandArt19Spec
