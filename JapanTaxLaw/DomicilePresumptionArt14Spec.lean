/-!
# DomicilePresumptionArt14Spec — 独立形式仕様

pinned 原文から独立に読み取った仕様。実装を import しない。
-/
namespace JapanTaxLaw.DomicilePresumptionArt14Spec

/-- 原文の推定の成立条件: 国内居住開始 かつ 各号該当。 -/
def presumedDomicile (movedToJapan : Bool) (listedCase : Bool) : Prop :=
  movedToJapan = true ∧ listedCase = true

end JapanTaxLaw.DomicilePresumptionArt14Spec
