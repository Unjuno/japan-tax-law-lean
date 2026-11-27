# Unit review — 関税定率法 第7条(4) EFFECT

Normative unit id: `NORM|55732d61aadf34d9ec30275f6f3461c7eb7c5699b8d8647180d92c9bc8124760`

Law: 143AC0000000054 (関税定率法), Act. SHA-256 924a01d3…86ae9c.

Verbatim source text (injected from the queue, not hand-typed): 「前項の相殺関税は、当該相殺関税を課されることとなる貨物の輸入者が納める義務があるものとする。」

Exact source position: `LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/Paragraph#4/ParagraphSentence/Sentence#1`.

Norm kind: **EFFECT** — the preceding paragraph's dumping duty is an obligation borne by the importer of the goods. Computable slice: obligor selection. CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The importer bears the duty obligation; another obligor is not selected. |
| T | `scripts/ci/transcription_audit.py` whole-law check for CustomsTariffArt7DumpingDutyObligor.lean. |
| D | PASS — transcription audit 781/781. |
| C | Only obligor selection is modeled. Duty computation and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffArt7DumpingDutyObligor.lean` — `Obligor`, `obligor=importer`, `dutyObligation`, three boundary theorems.
- Independent spec: `SpecObligor` Prop equality, representationally distinct; all five unit theorems axiom-free (rfl, cases).
- Build: full lake build success (2632 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Duty computation, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_ART7_DUTY_OBLIGOR.md`.
