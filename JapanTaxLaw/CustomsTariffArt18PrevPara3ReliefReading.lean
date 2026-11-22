import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt18PrevPara3ReliefReading — 関税定率法 第十八条(4)（準用）READING

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|33d7dae28845cef88c65728396c225a449cf3732b9a9e4340988b3c8addb54a9
  Source path: LawBody[1]/MainProvision/MainProvision[31]/Article:18/Article#18/
               Paragraph#4/ParagraphSentence/Sentence#1
  Article caption: （再輸出減税）

原文逐語（pinned, 一字一句改変なし）:
  「前条第三項の規定は、第一項の規定により関税の軽減を受けた者について準用する。」

Norm kind: READING — a 準用 (mutatis-mutandis application). The provisions of
前条第三項 (the preceding article's paragraph 3 — here 関税定率法 第十七条第三項)
are read in for a person who received a duty reduction (関税の軽減)
under 第一項 of this article. The computable slice models which source provision
is read in, the source paragraph number (3), the preceding-article offset (1),
the trigger paragraph number (1), and the recipient class. Numbers extracted
from the verbatim 前条第三項 / 第一項; all statutory strings from the queue;
no hand-typed CJK.

Variable contract (meaning / domain / type):
  Provision : Type — the single source provision read in (prevArticlePara3).
  PersonClass : Type — reliefRecipient (第一項の規定により関税の軽減を受けた者)
    or other.
  appliesViaReading : PersonClass -> Provision -> Prop — true iff reliefRecipient.
  sourceParagraph : Nat — 3 (前条第三項).
  sourceArticleOffset : Nat — 1 (前条).
  triggerParagraph : Nat — 1 (第一項).
  No numeric amount/unit/dimension applies (structural cross-reference).

Scope: only the cross-reference structure. The substantive content of 前条第三項
and 第一項, how relief was granted, other reading rules, and legal correctness are
NOT MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt18PrevPara3ReliefReading

/-- The source provision read in: 前条第三項の規定. -/
inductive Provision : Type
  | prevArticlePara3 : Provision

deriving instance DecidableEq for Provision

/-- The recipient class: a person who received duty relief under 第一項, or other. -/
inductive PersonClass : Type
  | reliefRecipient : PersonClass
  | other : PersonClass

deriving instance DecidableEq for PersonClass

/-- Source paragraph number 3, from 前条第三項. -/
def sourceParagraph : Nat := 3

/-- Preceding-article offset 1, from 前条. -/
def sourceArticleOffset : Nat := 1

/-- Trigger paragraph number 1, from 第一項. -/
def triggerParagraph : Nat := 1

/-- 準用: the source provision applies iff the person is a reliefRecipient. -/
def appliesViaReading (p : PersonClass) (_prov : Provision) : Prop :=
  p = PersonClass.reliefRecipient

/-- The source paragraph number is 3. -/
theorem source_paragraph_is_three : sourceParagraph = 3 := rfl

/-- The preceding-article offset is 1. -/
theorem source_article_offset_is_one : sourceArticleOffset = 1 := rfl

/-- The trigger paragraph number is 1. -/
theorem trigger_paragraph_is_one : triggerParagraph = 1 := rfl

/-- The reading applies to a relief recipient. -/
theorem applies_to_relief_recipient :
    appliesViaReading PersonClass.reliefRecipient Provision.prevArticlePara3 := rfl

/-- The reading does not apply to any other person. -/
theorem not_applies_to_other :
    ¬ appliesViaReading PersonClass.other Provision.prevArticlePara3 := by
  intro h
  cases h

end JapanTaxLaw.CustomsTariffArt18PrevPara3ReliefReading
