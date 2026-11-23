# Unit review — 関税定率法 附則第一条（ただし書）EXCEPTION

Normative unit id: `NORM|01ed33c34b3cea793208f86ea0e86fa6c3e2fc52b3f93a0b0dd94c09e6a0bd36`

Law: 143AC0000000054 (関税定率法), Act, revision `143AC0000000054_20260601_508AC0000000005`.

Verbatim source text: 「ただし、次の各号に掲げる改正規定は、当該各号に掲げる日から施行する。」 — a supplementary-provision proviso establishing staggered, per-item enforcement dates for enumerated amendment provisions. Needle injected from the queue, never hand-typed.

Exact source position: `LawBody[30]/SupplProvision/SupplProvision[1]/Article:1/Article#1/Paragraph#1/ParagraphSentence/Sentence#2` — needle is in a 附則, so the audit uses the `file` locator.

Norm kind: **EXCEPTION** — temporal enforcement-basis discrimination.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Amendment provisions take effect from their own listed dates, not the Act's general date. |
| T | `scripts/ci/transcription_audit.py` file-kind check for CustomsTariffSupplArt1StaggeredEnforcementException.lean. |
| D | PASS — transcription audit 459/459. |
| C | Only enforcement-basis discrimination modeled; enumerated items and dates out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/CustomsTariffSupplArt1StaggeredEnforcementException.lean` — `EnforcementBasis` (actWideDate/itemListedDate), `effectiveBasis=itemListedDate`, `perItem=true`.
- Independent spec: `SpecStaggered` Prop conjunction, representationally distinct; `implementation_satisfies_spec` axiom-free (`And.intro`/rfl).
- Build: full lake build success (1474 jobs); all four unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Enumerated amendment provisions, their actual dates, legal correctness.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_CUSTOMS_TARIFF_SUPPL_ART1_STAGGERED_ENFORCEMENT_EXCEPTION.md`.
