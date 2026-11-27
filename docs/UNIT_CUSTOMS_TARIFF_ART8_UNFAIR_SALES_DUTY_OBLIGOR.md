# Unit review — 関税定率法 第8条(3) EFFECT

Normative unit id: `NORM|c28c6f86eb781a5292f44784e7290218444ae1d396cd8a0b2a9af18b35bf9c14`

Law: 143AC0000000054 (関税定率法), Act. SHA-256 924a01d3…86ae9c.

Verbatim source text (injected from the queue, not hand-typed): 「前項の不当廉売関税は、当該不当廉売関税を課されることとなる貨物の輸入者が納める義務があるものとする。」

Exact source position: `LawBody[1]/MainProvision/MainProvision[17]/Article:8/Article#8/Paragraph#3/ParagraphSentence/Sentence#1`.

Norm kind: **EFFECT** — the preceding paragraph's unfair-sales duty is an obligation borne by the importer of the goods. Computable slice: obligor selection. CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The importer bears the duty obligation; another obligor is not selected. |
| T | `scripts/ci/transcription_audit.py` whole-law check for CustomsTariffArt8UnfairSalesDutyObligor.lean. |
| D | PASS — transcription audit 782/782. |
| C | Only obligor selection is modeled. Duty computation and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt8UnfairSalesDutyObligor.lean` — `Obligor`, `obligor=importer`, `dutyObligation`, three boundary theorems.
- Independent spec: `SpecObligor` Prop equality, representationally distinct; all five unit theorems axiom-free (rfl, cases).
- Build: full lake build success (2644 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Duty computation, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART8_UNFAIR_SALES_DUTY_OBLIGOR.md`.
