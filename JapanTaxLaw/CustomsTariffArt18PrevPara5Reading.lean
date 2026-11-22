import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt18PrevPara5Reading — 関税定率法 第十八条(3)（準用）READING

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|7c7c72010fb03b1074a0a2d4b307a2077af62f784e1a64424b59c5ee7dbf1101
  Source path: LawBody[1]/MainProvision/MainProvision[31]/Article:18/Article#18/
               Paragraph#3/ParagraphSentence/Sentence#2
  Article caption: （再輸出減税）

原文逐語（pinned, 一字一句改変なし）:
  「この場合においては、前条第五項の規定を準用する。」

Norm kind: READING — a 準用 (mutatis-mutandis application). In the case identified
by この場合 (this case, the trigger of paragraph 3), the provisions of 前条第五項
(the preceding article's paragraph 5 — here 関税定率法 第十七条第五項) are read in.
This models WHICH source provision applies in WHICH trigger case and the source
paragraph number (5) / preceding-article offset (1), not a string replacement.
The numbers 5 and 1 are extracted from the verbatim 前条第五項; the trigger case
is the この場合 of paragraph 3 from the source path.

Variable contract (meaning / unit / domain / type):
  Provision : Type — the single source provision read in (prevArticlePara5).
  Case : Type — thisCase (この場合) | other.
  appliesViaReading : Case -> Provision -> Prop — true iff thisCase.
  sourceParagraph : Nat — the source paragraph number 5 (第五項).
  sourceArticleOffset : Nat — preceding-article offset 1 (前条).
  No numeric amount/unit/rounding applies (structural cross-reference).

Scope: only the cross-reference structure (source provision, trigger case,
paragraph number and preceding-article offset). The substantive content of
前条第五項, the establishment of この場合, other reading rules,
and legal correctness are NOT MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt18PrevPara5Reading

/-- The source provision read in: 前条第五項の規定. -/
inductive Provision : Type
  | prevArticlePara5 : Provision

deriving instance DecidableEq for Provision

/-- The trigger case: この場合 versus any other case. -/
inductive Case : Type
  | thisCase : Case
  | other : Case

deriving instance DecidableEq for Case

/-- Source paragraph number 5, from 第五項. -/
def sourceParagraph : Nat := 5

/-- Preceding-article offset 1, from 前条. -/
def sourceArticleOffset : Nat := 1

/-- 準用: the source provision applies iff the trigger is この場合. -/
def appliesViaReading (c : Case) (_p : Provision) : Prop :=
  c = Case.thisCase

/-- The source paragraph number is 5. -/
theorem source_paragraph_is_five : sourceParagraph = 5 := rfl

/-- The preceding-article offset is 1. -/
theorem source_article_offset_is_one : sourceArticleOffset = 1 := rfl

/-- The reading does not apply outside この場合. -/
theorem not_applies_in_other : ¬ appliesViaReading Case.other Provision.prevArticlePara5 := by
  intro h
  cases h

end JapanTaxLaw.CustomsTariffArt18PrevPara5Reading
