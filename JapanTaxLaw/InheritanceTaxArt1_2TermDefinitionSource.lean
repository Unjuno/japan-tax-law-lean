import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt1_2TermDefinitionSource — DELEGATION

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Raw snapshot: data/raw/325AC0000000073_*.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|5535e9d60fcc528b55dc71a8ebb602f33891361f92b80dab7ad53701dca864dd
  Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:1_2/Article#1_2/Paragraph#1/ParagraphSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「この法律において、次の各号に掲げる用語の意義は、当該各号に定めるところによる。」

Norm kind: DELEGATION (with REFERENCE aspect) — in this Act, the meaning of
each listed term is governed by the respective following item. The computable
slice models the source selection (following items rather than an unspecified
alternative). The statutory quote above is byte-verbatim from the pinned
source; English prose here is descriptive only.

Variable contract (meaning / domain / type):
  DefinitionSource : Type — followingItems, other.
  definitionSource : DefinitionSource — the selected source of term meanings.
  No numeric amount/unit applies (structural source selection). The actual
  term definitions and legal correctness are NOT MODELLED.
  Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt1_2TermDefinitionSource

/-- Possible sources of term meanings under the Act. -/
inductive DefinitionSource : Type
  | followingItems : DefinitionSource
  | other : DefinitionSource

/-- Term meanings are governed by the following items. -/
def definitionSource : DefinitionSource := DefinitionSource.followingItems

/-- The selected source is the following items. -/
theorem source_is_following_items : definitionSource = DefinitionSource.followingItems := rfl

/-- An unspecified alternative is not selected. -/
theorem other_not_selected : definitionSource ≠ DefinitionSource.other := by
  unfold definitionSource
  intro h
  cases h

end JapanTaxLaw.InheritanceTaxArt1_2TermDefinitionSource
