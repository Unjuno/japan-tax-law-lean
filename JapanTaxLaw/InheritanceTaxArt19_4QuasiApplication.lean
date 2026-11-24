import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt19_4QuasiApplication — READING

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Raw snapshot: data/raw/325AC0000000073_*.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|e29e4e105e5b1ef84a82b9e35f096ec01045e79c65186e86f1a2fe08fedcd722
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:19_4/Article#19_4/Paragraph#3/ParagraphSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「前条第二項及び第三項の規定は、第一項の規定を適用する場合について準用する。」

Norm kind: READING — the 準用 (quasi-application / mutatis mutandis) clause.
Paragraphs 2 and 3 of the preceding Article are made applicable when Paragraph 1
of this Article is applied. The computable slice models which source paragraphs
are quasi-applied and which paragraph triggers the application. All statutory
facts derived from the needle; no hand-typed CJK.

Variable contract (meaning / domain / type):
  Paragraph : Type — para1 (第一項, the trigger), para2 (前条第二項), para3 (前条第三項).
  quasiAppliedFromPreceding : Paragraph -> Bool — true for para2 and para3.
  triggerParagraph : Paragraph = para1 — 第一項の規定を適用する場合.
  No numeric amount/unit applies (structural READING, not a formula).

Scope: only the quasi-application source-paragraph set and the trigger paragraph.
The content of the quasi-applied provisions, the reading-substitution sentence
(Sentence#2 of the same paragraph, outside this unit's needle), and legal
correctness are NOT MODELLED. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt19_4QuasiApplication

/-- The paragraphs named by the provision. -/
inductive Paragraph : Type
  | para1 : Paragraph
  | para2 : Paragraph
  | para3 : Paragraph

/-- 第一項の規定を適用する場合: Paragraph 1 is the trigger. -/
def triggerParagraph : Paragraph := Paragraph.para1

/-- 前条第二項及び第三項の規定は...準用する: paragraphs 2 and 3 are quasi-applied. -/
def quasiAppliedFromPreceding (p : Paragraph) : Bool :=
  match p with
  | Paragraph.para1 => false
  | Paragraph.para2 => true
  | Paragraph.para3 => true

/-- The trigger is Paragraph 1. -/
theorem trigger_is_para1 : triggerParagraph = Paragraph.para1 := rfl

/-- 前条第二項 is quasi-applied. -/
theorem para2_quasi_applied : quasiAppliedFromPreceding Paragraph.para2 = true := rfl

/-- 前条第三項 is quasi-applied. -/
theorem para3_quasi_applied : quasiAppliedFromPreceding Paragraph.para3 = true := rfl

/-- The trigger paragraph itself is not a source of quasi-application. -/
theorem trigger_not_quasi_applied : quasiAppliedFromPreceding Paragraph.para1 = false := rfl

end JapanTaxLaw.InheritanceTaxArt19_4QuasiApplication
