# Unit review — 関税定率法 第七条(27)（条件）CONDITION

Normative unit id: `NORM|28020c69b3e5d4d0606cd4ef67a43debfc5c5ed5be444e634b6d0acc304ba0c0`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号,
law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「第十七項の規定により延長する場合」 — the column-1 case label of Article 7 paragraph 27 Item 1: the case where the designated period is extended under the provisions of paragraph 17.

Exact source position:
`LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/Paragraph#27/Item#1/ItemSentence/Column#1/Sentence#1` — MainProvision Article 第七条, caption （相殺関税）. `find_article_text(...,"第七条")` returns that article (len 5989) containing the needle → article-kind locator used.

Norm kind: **CONDITION** — a case discriminator in paragraph 27's discriminated case analysis for extending a designated period. The computable slice models the decidable discrimination of the para-17 extension case; the paragraph number 17 is extracted structurally from the verbatim 第十七項. No statutory string is hand-typed.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | The case where the period is extended under paragraph 17 is distinguishable from other extension bases. |
| T | `python scripts/ci/transcription_audit.py` article-kind check 「customs tariff art.7 extension para17…↔ CustomsTariffArt7ExtensionPara17.lean」. Full audit: 338/338 checks passed. |
| D | PASS — audit reports `338/338 checks passed`. |
| C | Only the case discrimination is modeled. The anchor date, five-year cap, and paragraph substance are out of scope. |
| U | Transcription fidelity only. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTariffArt7ExtensionPara17.lean` — `ExtensionBasis` (para17/other), `extensionParagraph` (17), `isPara17Extension` (Bool).
- Independent spec: `SpecIsPara17Extension` propositional equality, representationally distinct from the Bool function; `agree_is_para17_extension` axiom-free via exhaustive `cases` with `rfl`/`cases` (no `decide`/`simp`/`propext`).
- Build: `lake build` → full build success (1064 jobs); unit build 5 jobs; unit theorem axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The anchor date for the extension cap, the five-year cap, the substance of paragraphs 17/19/22/24, and legal correctness. Computable slice of one CONDITION norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART7_EXTENSION_PARA17.md`.
