# Unit review — 関税定率法 第八条(14)（準用）READING

Normative unit id: `NORM|533e8fd979ea8c72174c0058f51b1b16fd737427b0e378f0dc295d0f0140ed08`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号,
law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「第六項から第八項までの規定は、前項の調査が開始された場合について準用する。」 — the provisions of paragraphs 6 through 8 are read (準用) into the case where the preceding paragraph (前項, para 13) investigation has begun.

Exact source position:
`LawBody[1]/MainProvision/MainProvision[17]/Article:8/Article#8/Paragraph#14/ParagraphSentence/Sentence#1` — MainProvision Article 第八条. `find_article_text(...,"第八条")` returns that article (len 6919) containing the needle → article-kind locator used.

Norm kind: **READING** — a 準用 (mutatis-mutandis application), distinct from a 読替え textual substitution. Source paragraph range 6–8 extracted structurally from the verbatim 第六項から第八項まで; trigger 前項=13 derived from the source path. No statutory string hand-typed.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | The provisions of paragraphs 6-8 apply when the 前項 (para 13) investigation has begun. |
| T | `python scripts/ci/transcription_audit.py` article-kind check 「customs tariff art.8 prev reading 6to8…↔ CustomsTariffArt8PrevReading6to8.lean」. Full audit: 344/344 checks passed. |
| D | PASS — audit reports `344/344 checks passed`. |
| C | Only the cross-reference structure is modeled. The substantive content of paragraphs 6-8/13 and the trigger's establishment are out of scope. |
| U | Transcription fidelity only. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTariffArt8PrevReading6to8.lean` — `Provision` (para6/para7/para8), `InvestigationState` (prevStarted/other), `provisionParagraph`, `triggerParagraph` (13), `appliesViaReading`.
- Independent spec: `SpecApplies` three-way disjunction, representationally distinct from impl's `p`-independent predicate but equivalent for all inputs; `agree_applies_via_reading` axiom-free via exhaustive cases/constructor/rfl/contradiction.
- Build: `lake build` → full build success (1082 jobs); unit build 5 jobs; unit theorem axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The substantive content of paragraphs 6, 7, 8, 13, the trigger's establishment, other reading rules, and legal correctness. Computable slice of one READING norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART8_PREV_READING_6TO8.md`.
