# Unit review — 関税定率法 第八条(24)（準用）READING

Normative unit id: `NORM|9839bfa7e7f185855424800f3e4a5eb453f506c4c71e60153da993af1f76d0ba`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号,
law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「第七項及び第八項の規定は、第二十二項の調査が開始された場合について準用する。」 — the provisions of paragraphs 7 and 8 are read (準用) into the case where the paragraph-22 investigation has begun.

Exact source position:
`LawBody[1]/MainProvision/MainProvision[17]/Article:8/Article#8/Paragraph#24/ParagraphSentence/Sentence#1` — MainProvision Article 第八条. `find_article_text(...,"第八条")` returns that article (len 6919) containing the needle → article-kind locator used.

Norm kind: **READING** — a 準用 (mutatis-mutandis application), distinct from a 読替え textual substitution. Source paragraphs 7/8 and the explicit trigger 22 are extracted structurally from the verbatim. No statutory string hand-typed.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | The provisions of paragraphs 7 and 8 apply when the paragraph-22 investigation has begun. |
| T | `python scripts/ci/transcription_audit.py` article-kind check 「customs tariff art.8 reading 7 8 by 22…↔ CustomsTariffArt8Reading7_8By22.lean」. Full audit: 348/348 checks passed. |
| D | PASS — audit reports `348/348 checks passed`. |
| C | Only the cross-reference structure is modeled. The substantive content of paragraphs 7/8/22 and the trigger's establishment are out of scope. |
| U | Transcription fidelity only. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTariffArt8Reading7_8By22.lean` — `Provision` (para7/para8), `InvestigationState` (para22Started/other), `provisionParagraph`, `triggerParagraph` (22), `appliesViaReading`.
- Independent spec: `SpecApplies` pairwise disjunction, representationally distinct from impl's `p`-independent predicate but equivalent for all inputs; `agree_applies_via_reading` axiom-free via cases/constructor/rfl/cases-h.
- Build: `lake build` → full build success (1094 jobs); unit build 5 jobs; unit theorem axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The substantive content of paragraphs 7, 8, 22, the trigger's establishment, other reading rules, and legal correctness. Computable slice of one READING norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART8_READING7_8_BY22.md`.
