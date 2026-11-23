import JapanTaxLaw.TaxFinance

/-!
# DisasterTaxReliefArt3ArticleRangeReading — READING

Pinned source:
  Law id: 322AC0000000175
  Official title: 昭和二十二年法律第百七十五号（災害被害者に対する租税の減免、徴収猶予等に関する法律）
  Law number: 昭和二十二年法律第百七十五号
  Law type: Act (法律)
  Raw snapshot: data/raw/322AC0000000175_20220101_503AC0000000011.law.json
  sha256: c3bb5b0bdffbdefd2ee5f358d90ad9e0922d4c887ecb2b133aa7d613f5f4e7ef
  Normative unit id: NORM|cc418cedeeb1fc09da3ff8faf6c482785b2381b98026b29f92bbfb80f53e3cf1
  Source path: LawBody[1]/MainProvision/MainProvision[2]/Article:3/Article#3/
               Paragraph#1/ParagraphSentence/Sentence#2

原文逐語（pinned, 一字一句改変なし）:
  「この場合においては、同法第百十二条から第百十四条までの規定を準用する。」

Norm kind: READING — a 準用 (mutatis-mutandis application). In the trigger case
この場合, the provisions of 同法第百十二条から第百十四条まで (Articles 112 to
114 of the same Act) are read in. The computable slice models the inclusive
article range and the trigger-case discrimination. The range is extracted
structurally from the needle's kanji numerals; no hand-typed CJK.

Variable contract (meaning / domain / type):
  TriggerCase : Type — thisCase (この場合) or other.
  appliesViaReading : TriggerCase -> Prop — true iff thisCase.
  sourceArticleLo/Hi : Nat — 112 and 114 (inclusive range).
  No numeric amount/unit applies (structural cross-reference).

Scope: only the article-range reference and trigger-case discrimination. The
substantive content of Articles 112..114, the establishment of この場合,
and legal correctness are NOT MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterTaxReliefArt3ArticleRangeReading

/-- The trigger case: この場合 or other. -/
inductive TriggerCase : Type
  | thisCase : TriggerCase
  | other : TriggerCase

/-- Lower bound of the source article range (第百十二条). -/
def sourceArticleLo : Nat := 112

/-- Upper bound of the source article range (第百十四条). -/
def sourceArticleHi : Nat := 114

/-- 準用: the range applies iff the trigger is この場合. -/
def appliesViaReading (c : TriggerCase) : Prop :=
  c = TriggerCase.thisCase

/-- The source article range is 112..114. -/
theorem source_range : sourceArticleLo = 112 ∧ sourceArticleHi = 114 := ⟨rfl, rfl⟩

/-- The reading applies in この場合. -/
theorem applies_in_this_case : appliesViaReading TriggerCase.thisCase := rfl

/-- The reading does not apply outside この場合. -/
theorem not_applies_in_other : ¬ appliesViaReading TriggerCase.other := by
  intro h
  cases h

end JapanTaxLaw.DisasterTaxReliefArt3ArticleRangeReading
