import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt8ReadingSubstitution — 関税定率法 第八条(14)（読替え）READING

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|4faefcb5ffeac4edb7ad4af13982cb09a48df4d67afb5f2ff696f74a9ed6059c
  Source path: LawBody[1]/MainProvision/MainProvision[17]/Article:8/Article#8/
               Paragraph#14/ParagraphSentence/Sentence#2
  Article caption: （不当廉売関税）

原文逐語（pinned, 一字一句改変なし）:
  「この場合において、第六項本文中「一年以内に」とあるのは、「一年以内において速やかに」と読み替えるものとする。」

Norm kind: READING — a textual substitution (読替え). In the case at hand, the
phrase 一年以内に in 第六項 is to be read as 一年以内において速やかに. Both phrases
are extracted structurally from the verbatim needle's own 「」 brackets — no
hand-typed statutory strings.

Variable contract (meaning / unit / domain / type):
  text : String — a piece of statutory text.
  oldPhrase : String = 一年以内に (the phrase being replaced).
  newPhrase : String = 一年以内において速やかに (the replacement reading).
  readAs text := if text = oldPhrase then newPhrase else text (propositional
  equality — a BEq `==` here would drag in forbidden Classical.choice via simp).
  This is a single-phrase substitution, scoped to the stated case; it does NOT
  model recursive/global string replacement or the surrounding case conditions.

Scope: only this reading substitution. The underlying 第六項 time limit, other
reading rules, other items/paragraphs/articles and legal correctness are NOT
MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt8ReadingSubstitution

/-- The phrase being replaced (一年以内に). -/
def oldPhrase : String := "一年以内に"

/-- The replacement reading (一年以内において速やかに). -/
def newPhrase : String := "一年以内において速やかに"

/-- 読み替え: replace the phrase when it matches; otherwise leave text unchanged.
    Uses propositional equality (not BEq `==`) so that kernel proofs do not
    depend on forbidden Classical.choice. -/
def readAs (text : String) : String :=
  if text = oldPhrase then newPhrase else text

end JapanTaxLaw.CustomsTariffArt8ReadingSubstitution
