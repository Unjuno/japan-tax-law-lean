/-!
# MergerExceptionArt24 — 340AC0000000034 art.24（合併（適格合併を除く。））

Pinned source: data/raw/340AC0000000034_20261001_508AC0000000012.law.json
source_path: LawBody[3]/MainProvision/MainProvision[1]/Article:24/Article#24/Paragraph#1/Item#1/ItemSentence/Sentence#1
原文（12文字, 独立抽出で照合）:「合併（適格合併を除く。）」

規範単位（EXCEPTION）: 合併のうち適格合併は本条の対象から除外される。
  - isMerger: 合併であるか（caller-established）
  - isQualified: 適格合併であるか（caller-established）
適格合併の要件・手続・法的効果は当該単位外で NOT MODELLED。
-/
namespace JapanTaxLaw.MergerExceptionArt24

/-- 原文の例外適用後の判定: 合併であり、かつ適格合併でないこと。 -/
def isCoveredMerger (isMerger : Bool) (isQualified : Bool) : Bool :=
  isMerger && !isQualified

theorem covers_ordinary_merger : isCoveredMerger true false = true := by decide
theorem excludes_qualified_merger : isCoveredMerger true true = false := by decide
theorem excludes_non_merger : isCoveredMerger false false = false := by decide

/-- 一般命題: 実装は原文の「合併（適格合併を除く。）」と同値。 -/
theorem isCoveredMerger_iff (m q : Bool) :
    isCoveredMerger m q = true ↔ m = true ∧ q = false := by
  cases m <;> cases q <;> simp [isCoveredMerger]

end JapanTaxLaw.MergerExceptionArt24
