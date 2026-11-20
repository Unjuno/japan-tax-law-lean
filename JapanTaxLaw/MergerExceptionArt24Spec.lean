/-!
# MergerExceptionArt24Spec — 独立形式仕様

pinned 原文「合併（適格合併を除く。）」から独立に読み取った仕様。
実装を import しない。
-/
namespace JapanTaxLaw.MergerExceptionArt24Spec

/-- 原文の適用範囲: 合併であり、適格合併ではないこと。 -/
def inScope (isMerger : Bool) (isQualified : Bool) : Prop :=
  isMerger = true ∧ isQualified = false

end JapanTaxLaw.MergerExceptionArt24Spec
