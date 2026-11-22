import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt7ExtensionPara17 — 関税定率法 第七条(27)（条件）CONDITION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|28020c69b3e5d4d0606cd4ef67a43debfc5c5ed5be444e634b6d0acc304ba0c0
  Source path: LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/
               Paragraph#27/Item#1/ItemSentence/Column#1/Sentence#1
  Article caption: （相殺関税）

原文逐語（pinned, 一字一句改変なし）:
  「第十七項の規定により延長する場合」

Norm kind: CONDITION — a case label in paragraph 27's discriminated case analysis
for extending a designated period. The verbatim needle is the column-1 label of
Item 1: the case where the period is extended under the provisions of paragraph
17 (第十七項の規定により延長する場合). The computable slice models the
decidable discrimination of this case. The paragraph number 17 is extracted
structurally from the verbatim 第十七項; no statutory string is hand-typed.

Variable contract (meaning / unit / domain / type):
  ExtensionBasis : Type — para17 (this case) | other (any other basis).
  extensionParagraph : Nat = 17 (the paragraph number from the verbatim).
  isPara17Extension : ExtensionBasis -> Bool — true iff this is the para-17 case.
  No numeric amount/unit applies (a case discriminator, not a formula).

Scope: only the discrimination of this condition. Which date anchors the extension
cap, the five-year cap itself, the substance of paragraphs 17/19/22/24, and
legal correctness are NOT MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt7ExtensionPara17

/-- Basis for the extension (第十七項 = this case; other = any other basis). -/
inductive ExtensionBasis : Type
  | para17 : ExtensionBasis
  | other : ExtensionBasis

deriving instance DecidableEq for ExtensionBasis

/-- The paragraph number 第十七項 = 17, extracted from the verbatim. -/
def extensionParagraph : Nat := 17

/-- Decidable discrimination of the para-17 extension case. -/
def isPara17Extension (e : ExtensionBasis) : Bool :=
  match e with
  | ExtensionBasis.para17 => true
  | ExtensionBasis.other => false

end JapanTaxLaw.CustomsTariffArt7ExtensionPara17
