# Unit review — 関税定率法 第七条(25)（準用）READING

Normative unit id: `NORM|f8c7e9bb416eb400df2c804473bd1982fd394436266d05baed397418ac7c731e`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号,
law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「第八項、第九項及び第二十項の規定は、前項の調査が開始された場合について準用する。」 — the provisions of paragraphs 8, 9 and 20 are read (準用) into the case where the preceding paragraph (前項, para 24) investigation has begun.

Exact source position:
`LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/Paragraph#25/ParagraphSentence/Sentence#1` — MainProvision Article 第七条, caption （相殺関税）. `find_article_text(...,"第七条")` returns that article (len 5989) containing the needle → article-kind locator used.

Norm kind: **READING** — a 準用 (mutatis-mutandis application), distinct from a 読替え textual substitution. It models WHICH source provisions (para 8, 9, 20) are read into WHICH trigger case (前項 = para 24 investigation started), not a string replacement. Source paragraph numbers 8/9/20 and the 準用 marker are extracted structurally from the verbatim needle; the trigger number 24 is the immediately preceding paragraph derived from the source path (Paragraph#25).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | The provisions of paragraphs 8, 9 and 20 apply when the 前項 (para 24) investigation has begun. |
| T | `python scripts/ci/transcription_audit.py` article-kind check 「customs tariff art.7 prev paragraph reading - CustomsTariffArt7PrevParagraphReading.lean」. Full audit: 330/330 checks passed. |
| D | PASS — audit reports `330/330 checks passed`. |
| C | Only the cross-reference structure is modeled. The substantive content of paragraphs 8/9/20/24 and the trigger's establishment are out of scope. |
| U | Transcription fidelity only. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTariffArt7PrevParagraphReading.lean` — `Provision` (para8/para9/para20), `InvestigationState` (prevStarted/other), `provisionParagraph` (8/9/20), `triggerParagraph` (24), `appliesViaReading`.
- Independent spec: `SpecApplies` enumerates the three source provisions as an explicit three-way disjunction, representationally distinct from impl's `p`-independent predicate but equivalent for all inputs (Provision has exactly three constructors). `agree_applies_via_reading` axiom-free via explicit cases/constructor/rfl/contradiction (no `decide`, no `simp`/`propext`).
- Build: `lake build` → full build success (1040 jobs); unit build 5 jobs; unit theorem axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The substantive content of paragraphs 8, 9, 20, 24, the trigger's establishment, other reading rules, and legal correctness. Computable slice of one READING norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART7_PREV_PARAGRAPH_READING.md`.
