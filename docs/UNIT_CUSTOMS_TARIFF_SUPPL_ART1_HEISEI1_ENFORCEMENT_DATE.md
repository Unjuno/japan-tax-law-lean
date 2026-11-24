# Unit review — 関税定率法 附則第一条 施行期日 REFERENCE (平成元年四月一日)

Normative unit id: `NORM|c1eba0f628630c68c7f8946b94e9d3f7072b2686ad40ae64ab46e7bd1da7af6c`

Law: 143AC0000000054 (関税定率法), Act. SHA-256 924a01d3…986ae9c3.

Verbatim source text (injected from the queue, not hand-typed): 「この法律は、平成元年四月一日から施行する。」

Exact source position: `LawBody[48]/SupplProvision/SupplProvision[1]/Article:1/Article#1/Paragraph#1/ParagraphSentence/Sentence#1` — the whole Paragraph 1 is this sentence. Note: this law contains multiple `第一条` nodes, so the transcription check uses the whole-law locator rather than the article-title locator.

Norm kind: **REFERENCE** — a temporal-application clause fixing the enforcement date at 平成元年四月一日 (Heisei 1, April 1). 元 (first year of era) parsed as 1 programmatically; all statutory date components from the needle; no hand-typed CJK.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The law is in force on and after 平成元年四月一日; component-wise: year=1 (元), month=4, day=1. |
| T | `scripts/ci/transcription_audit.py` whole-law check for CustomsTariffSupplArt1Heisei1EnforcementDate.lean. |
| D | PASS — transcription audit 482/482. |
| C | Only within-era enforcement-date comparison modeled. Gregorian identity of Heisei 1, cross-era transitions, other supplementary provisions, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffSupplArt1Heisei1EnforcementDate.lean` — `Date` (era-year/month/day), `enforcementDate=⟨1,4,1⟩`, `leDate`, `inForce`, component and boundary theorems.
- Independent spec: `SpecEnforcementDate` Prop conjunction, representationally distinct; `enforcement_satisfies_spec` axiom-free (And.intro/rfl).
- Build: full lake build success (1585 jobs); all seven unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Gregorian conversion, cross-era transitions, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_SUPPL_ART1_HEISEI1_ENFORCEMENT_DATE.md`.
