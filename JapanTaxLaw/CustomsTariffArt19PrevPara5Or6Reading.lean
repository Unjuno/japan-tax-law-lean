import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt19PrevPara5Or6Reading — 関税定率法 第十九条(8)（準用）READING

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|a0184c1fc0cb64c644aa5ef470ba11907d10add61cb7dfb49ce9901bd8f88e68
  Source path: LawBody[1]/MainProvision/MainProvision[32]/Article:19/Article#19/
               Paragraph#8/ParagraphSentence/Sentence#1
  Article caption: （輸出貨物の製造用原料品の減税、免税又は戻し税等）

原文逐語（pinned, 一字一句改変なし）:
  「前項の規定は、第五項又は第六項の規定を適用する場合について準用する。」

Norm kind: READING — a 準用 (mutatis-mutandis application). The provisions of
前項 (the immediately preceding paragraph) are read in for the case where
either 第五項 or 第六項 provisions apply — a disjunctive trigger. The computable
slice models which source provision is read in, the preceding-paragraph offset (1),
the two trigger paragraph numbers (5 and 6), and the disjunctive
trigger-case discrimination. All statutory sub-terms extracted from the needle;
no hand-typed CJK.

Variable contract (meaning / domain / type):
  Provision : Type — the single source provision read in (prevParagraph).
  Trigger : Type — para5 (第五項), para6 (第六項), or other.
  appliesViaReading : Trigger -> Provision -> Prop — true iff the trigger is
    para5 OR para6 (the 又は disjunction).
  sourceParagraphOffset : Nat — 1 (前項).
  triggerParaA : Nat — 5; triggerParaB : Nat — 6.
  No numeric amount/unit/dimension applies (structural cross-reference).

Scope: only the cross-reference structure and disjunctive trigger. The substantive
content of 前項 / 第五項 / 第六項, the establishment of either trigger,
other reading rules, and legal correctness are NOT MODELLED. Human legal review
remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt19PrevPara5Or6Reading

/-- The source provision read in: 前項の規定. -/
inductive Provision : Type
  | prevParagraph : Provision

deriving instance DecidableEq for Provision

/-- The disjunctive trigger: 第五項, 第六項, or other. -/
inductive Trigger : Type
  | para5 : Trigger
  | para6 : Trigger
  | other : Trigger

deriving instance DecidableEq for Trigger

/-- Preceding-paragraph offset 1, from 前項. -/
def sourceParagraphOffset : Nat := 1

/-- Trigger paragraph number 5, from 第五項. -/
def triggerParaA : Nat := 5

/-- Trigger paragraph number 6, from 第六項. -/
def triggerParaB : Nat := 6

/-- 準用: the source provision applies iff the trigger is 第五項 OR 第六項. -/
def appliesViaReading (tr : Trigger) (_p : Provision) : Prop :=
  tr = Trigger.para5 ∨ tr = Trigger.para6

/-- The preceding-paragraph offset is 1. -/
theorem source_offset_is_one : sourceParagraphOffset = 1 := rfl

/-- The trigger paragraph numbers are 5 and 6. -/
theorem trigger_numbers : triggerParaA = 5 ∧ triggerParaB = 6 := ⟨rfl, rfl⟩

/-- The reading applies for the 第五項 trigger. -/
theorem applies_for_para5 : appliesViaReading Trigger.para5 Provision.prevParagraph := by
  left; rfl

/-- The reading applies for the 第六項 trigger. -/
theorem applies_for_para6 : appliesViaReading Trigger.para6 Provision.prevParagraph := by
  right; rfl

/-- The reading does not apply outside the two triggers. -/
theorem not_applies_for_other : ¬ appliesViaReading Trigger.other Provision.prevParagraph := by
  intro h
  rcases h with h | h <;> cases h

end JapanTaxLaw.CustomsTariffArt19PrevPara5Or6Reading
