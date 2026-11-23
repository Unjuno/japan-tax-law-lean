import JapanTaxLaw.TaxFinance

/-!
# DisasterTaxReliefOrderArt6PrecedingTwoReading — READING

Pinned source:
  Law id: 322CO0000000268
  Official title: 昭和二十二年政令第二百六十八号（災害被害者に対する租税の減免、徴収猶予等に関する法律の施行に関する政令）
  Law number: 昭和二十二年政令第二百六十八号
  Law type: CabinetOrder (政令)
  Raw snapshot: data/raw/322CO0000000268_*.law.json
  sha256: f6fe1c9380cd7659d682d0b6d294c920f364045905a23f624f372c419a66a21c
  Normative unit id: NORM|d5894392c229474ffbca28c6632b178fecd3bfa7d5e949295bfb5945618024bf
  Source path: LawBody[1]/MainProvision/MainProvision[6]/Article:6/Article#6/
               Paragraph#1/ParagraphSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「前二条の規定は、第三条の二第四項の場合について、これを準用する。」

Norm kind: READING — a 準用 (mutatis-mutandis application). The provisions of
前二条 (the two preceding articles, 4 and 5 relative to this article 6)
are read in for the case 第3条の二第4項. The computable slice models the
source-article range and the trigger-case discrimination. All structural facts
extracted from the needle and the source path; no hand-typed CJK.

Variable contract (meaning / domain / type):
  TriggerCase : Type — targetCase (第3条の二第4項の場合) or other.
  appliesViaReading : TriggerCase -> Prop — true iff targetCase.
  sourceArticleLo/Hi : Nat — 4 and 5 (前二条 of article 6).
  No numeric amount/unit applies (structural cross-reference).

Scope: only the article-range reference and trigger-case discrimination. The
substantive content of Articles 4/5 and 第3条の二第4項, the
trigger's establishment, and legal correctness are NOT MODELLED.
Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderArt6PrecedingTwoReading

/-- The trigger case: 第3条の二第4項の場合, or other. -/
inductive TriggerCase : Type
  | targetCase : TriggerCase
  | other : TriggerCase

/-- Lower bound of the source range (前二条 of article 6). -/
def sourceArticleLo : Nat := 4

/-- Upper bound of the source range. -/
def sourceArticleHi : Nat := 5

/-- 準用: the source provisions apply iff the trigger is the target case. -/
def appliesViaReading (c : TriggerCase) : Prop :=
  c = TriggerCase.targetCase

/-- The source range is 4..5. -/
theorem source_range : sourceArticleLo = 4 ∧ sourceArticleHi = 5 := ⟨rfl, rfl⟩

/-- The reading applies in the target case. -/
theorem applies_in_target : appliesViaReading TriggerCase.targetCase := rfl

/-- The reading does not apply outside the target case. -/
theorem not_applies_in_other : ¬ appliesViaReading TriggerCase.other := by
  intro h
  cases h

end JapanTaxLaw.DisasterTaxReliefOrderArt6PrecedingTwoReading
