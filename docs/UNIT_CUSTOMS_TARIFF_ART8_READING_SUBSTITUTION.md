# Unit review — 関税定率法 第八条(14)（読替え）READING

Normative unit id: `NORM|4faefcb5ffeac4edb7ad4af13982cb09a48df4d67afb5f2ff696f74a9ed6059c`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号,
law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「この場合において、第六項本文中「一年以内に」とあるのは、「一年以内において速やかに」と読み替えるものとする。」 — in the stated case, the phrase 「一年以内に」 in 第六項 is to be read as 「一年以内において速やかに」。

Exact source position:
`LawBody[1]/MainProvision/MainProvision[17]/Article:8/Article#8/Paragraph#14/ParagraphSentence/Sentence#2` — MainProvision Article 第八条, caption （不当廉売関税）. `find_article_text(...,"第八条")` returns that article (len 6919) containing the needle → article-kind locator used.

Norm kind: **READING** (読替え) — a single-phrase textual substitution: 「一年以内に」→「一年以内において速やかに」。 Both phrases extracted structurally from the verbatim needle's own 「」 brackets — no hand-typed statutory strings. Note the needle itself contains 「」 brackets; byte-fidelity confirmed by exact span between first 「 and last 」 (EXACT MATCH). Modeled as `readAs text := if text = oldPhrase then newPhrase else text` (propositional equality — a BEq `==` here would pull in forbidden Classical.choice via simp). The underlying 第六項 time limit, other reading rules, and surrounding case conditions are NOT MODELLED.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | In the stated case, the phrase 一年以内に is read as 一年以内において速やかに; other text unchanged; the two phrases differ. |
| T (reproduction) | `python scripts/ci/transcription_audit.py` article-kind check 「customs tariff art.8 reading substitution…↔ CustomsTariffArt8ReadingSubstitution.lean」. Full audit: 294/294 checks passed. |
| D (decision) | PASS — audit reports `294/294 checks passed`. |
| C (competing interpretation) | Only the single-phrase reading substitution is modeled. Global/recursive replacement, surrounding case conditions, other reading rules, other paragraphs/articles are out of scope. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTariffArt8ReadingSubstitution.lean` — `oldPhrase`, `newPhrase` (String, injected), `readAs` (propositional `if`).
- Independent spec: `SpecReadAs` propositional input/output relation (case disjunction), `agree_read_as` universal axiom-free (only `[propext]` after BEq→propositional fix), `phrases_distinct` axiom-free.
- FORBIDDEN-AXIOM CORRECTION: initial `agree_read_as` depended on `[propext, Classical.choice, Quot.sound]` because `simp` on a BEq `==` if pulls in Classical.choice; diagnosed via scratch isolation (by_cases on String equality is axiom-free; simp of BEq if is not); fixed by switching `readAs` to propositional equality `if text = oldPhrase` — probe now only `[propext]`.
- Build: `lake build` → full build success (932 jobs); unit build 5 jobs; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

第六項 time limit, other reading rules, surrounding case conditions, other paragraphs/articles. Computable slice of one READING norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART8_READING_SUBSTITUTION.md`.
