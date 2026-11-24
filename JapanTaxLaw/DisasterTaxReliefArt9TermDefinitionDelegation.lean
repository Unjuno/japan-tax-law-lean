import JapanTaxLaw.TaxFinance

/-!
# DisasterTaxReliefArt9TermDefinitionDelegation — DELEGATION

Pinned source:
  Law id: 322AC0000000175
  Official title: 昭和二十二年法律第百七十五号（災害被害者に対する租税の減免、徴収猶予等に関する法律）
  Law number: 昭和二十二年法律第百七十五号
  Law type: Act (法律)
  Raw snapshot: data/raw/322AC0000000175_*.law.json
  sha256: c3bb5b0bdffbdefd2ee5f358d90ad9e0922d4c887ecb2b133aa7d613f5f4e7ef
  Normative unit id: NORM|200175613e1a4cd1c5e1d7911ce4f45bd97c4d71bebd705ed18c1f06db87cab1
  Source path: LawBody[1]/MainProvision/MainProvision[8]/Article:9/Article#9/Paragraph#2/ParagraphSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「前項において、次の各号に掲げる用語の意義は、当該各号に定めるところによる。」

Norm kind: DELEGATION — a definitional delegation clause: in 前項 (the
preceding paragraph), the 用語の意義 (meanings of terms) are as prescribed
by the 各号 (the following items). The computable slice models the
definition-source selection: the meanings are supplied by the listed items.
All statutory terms below are reproduced programmatically from the verbatim
needle; the canonical quote is byte-verbatim.

Variable contract (meaning / domain / type):
  DefinitionSource : Type — listedItems (当該各号に定めるところ) or other.
  definitionSource : DefinitionSource — the source of 用語の意義.
  The actual definitions in the items are a separate norm, NOT MODELLED here.

Scope: only the definition-source selection. The content of the items' definitions,
the 前項 paragraph's substance, and legal correctness are NOT MODELLED.
Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterTaxReliefArt9TermDefinitionDelegation

/-- The source of the terms' meanings. -/
inductive DefinitionSource : Type
  | listedItems : DefinitionSource
  | other : DefinitionSource

/-- 当該各号に定めるところによる: meanings are prescribed by the listed items. -/
def definitionSource : DefinitionSource := DefinitionSource.listedItems

/-- The definition source is the listed items. -/
theorem source_is_listed_items : definitionSource = DefinitionSource.listedItems := rfl

/-- The definition source is not 'other'. -/
theorem source_not_other : definitionSource ≠ DefinitionSource.other := by
  unfold definitionSource
  intro h
  cases h

end JapanTaxLaw.DisasterTaxReliefArt9TermDefinitionDelegation
