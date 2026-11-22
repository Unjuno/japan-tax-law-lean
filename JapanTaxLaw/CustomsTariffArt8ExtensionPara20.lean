import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt8ExtensionPara20 — 関税定率法 第八条(30)（条件）CONDITION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|49816f0201acd08b02754683d53a55008f897714937b0ffa08fdce6bba139efc
  Source path: LawBody[1]/MainProvision/MainProvision[17]/Article:8/Article#8/
               Paragraph#30/Item#1/ItemSentence/Column#1/Sentence#1
  Article caption: （不当廉売関税）

原文逐語（pinned, 一字一句改変なし）:
  「第二十項の規定により延長する場合」

Norm kind: CONDITION — a case label in paragraph 30's discriminated case analysis
for extending a designated period. The verbatim needle is the column-1 label of
Item 1: the case where the period is extended under the provisions of paragraph
20. The computable slice models the decidable discrimination of this case.
The paragraph number 20 is extracted structurally from the verbatim; no
statutory string is hand-typed.

Variable contract (meaning / unit / domain / type):
  ExtensionBasis : Type — para20 (this case) | other (any other basis).
  extensionParagraph : Nat = 20 (from the verbatim 第二十項).
  isPara20Extension : ExtensionBasis -> Bool — true iff this is the para-20 case.
  No numeric amount/unit applies (case discriminator, not a formula).

Scope: only the case discrimination. The anchor date, five-year cap, substance of
paragraph 20, and legal correctness are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt8ExtensionPara20

/-- Basis for the extension (第二十項 = this case; other = any other basis). -/
inductive ExtensionBasis : Type
  | para20 : ExtensionBasis
  | other : ExtensionBasis

deriving instance DecidableEq for ExtensionBasis

/-- The paragraph number 第二十項 = 20, extracted from the verbatim. -/
def extensionParagraph : Nat := 20

/-- Decidable discrimination of the para-20 extension case. -/
def isPara20Extension (e : ExtensionBasis) : Bool :=
  match e with
  | ExtensionBasis.para20 => true
  | ExtensionBasis.other => false

end JapanTaxLaw.CustomsTariffArt8ExtensionPara20
