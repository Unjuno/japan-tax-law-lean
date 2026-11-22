# Unit review — 関税定率法 第七条(21)（準用）READING

Normative unit id: `NORM|bfcac1c4b65905e68d25b72571e490792faac1b89d59528e53f37f99f733fd64`

Law: 143AC0000000054 (関税定率法), law number 明治四十三年法律第五十四号,
law_type Act (法律), revision `143AC0000000054_20260601_508AC0000000005` (from INVENTORY `current_revision`,
matched raw), snapshot `data/raw/143AC0000000054_20260601_508AC0000000005.law.json`,
sha256 `924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c`.

Verbatim source text: 「第八項及び第九項の規定は、第十九項の調査が開始された場合について準用する。」 — the provisions of paragraphs 8 and 9 are read (準用) into the case where the paragraph-19 investigation has been started.

Exact source position:
`LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/Paragraph#21/ParagraphSentence/Sentence#1` — MainProvision Article 第七条, caption （相殺関税）. `find_article_text(...,"第七条")` returns that article (len 5989) containing the needle → article-kind locator used.

Norm kind: **READING** — a 準用 (mutatis-mutandis application), distinct from a 読替え textual substitution. It models WHICH source provisions (para 8, para 9) are read into WHICH trigger case (para-19 investigation started), not a string replacement. Paragraph numbers 8/9/19 and the 準用 marker are extracted structurally from the verbatim needle.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | The provisions of paragraphs 8 and 9 apply when the paragraph-19 investigation has begun. |
| T | `python scripts/ci/transcription_audit.py` article-kind check 「customs tariff art.7 reading application - CustomsTariffArt7ReadingApplication.lean」. Full audit: 327/327 checks passed. |
| D | PASS — audit reports `327/327 checks passed`. |
| C | Only the cross-reference structure is modeled. The substantive content of paragraphs 8/9/19 and the trigger's establishment are out of scope. |
| U | Transcription fidelity only. Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/CustomsTariffArt7ReadingApplication.lean` — `Provision` (para8/para9), `InvestigationState` (para19Started/other), `provisionParagraph` (8/9), `triggerParagraph` (19), `appliesViaReading`.
- Independent spec: `SpecApplies` enumerates the two source provisions as an explicit pairwise disjunction, representationally distinct from impl's `p`-independent predicate but equivalent for all inputs (Provision has exactly two constructors). `agree_applies_via_reading` axiom-free via explicit cases/constructor/rfl (no `decide`, no `simp`/`propext`).
- Build: `lake build` → full build success (1031 jobs); unit build 5 jobs; unit theorem axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled (explicitly retained as unhandled scope)

The substantive content of paragraphs 8, 9, 19, the trigger's establishment, other reading rules, and legal correctness. Computable slice of one READING norm unit, not an article-level or law-level completion claim.

## Adversarial review

Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART7_READING_APPLICATION.md`.
