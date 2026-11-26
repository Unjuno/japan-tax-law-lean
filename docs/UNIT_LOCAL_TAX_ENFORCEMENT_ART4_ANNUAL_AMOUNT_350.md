# Unit review — 地方税法施行規則 附則 第四条 table-cell CONDITION (annual amount <=350)

Normative unit id: `NORM|c8d9f6f7319a50729e1de85ce41a2c51e37f8a03b6cf39647b6bb44bfe202fb1`

Law: 329M50000002023 (地方税法施行規則), MinisterialOrdinance. SHA-256 5ffb833b…bb217e.

Verbatim source text (injected from the queue, not hand-typed): 「年３５０万円以下の金額　（（２１））」

Exact source position: `LawBody[79]/SupplProvision/SupplProvision[4]/Article:4/Article#4/Paragraph#2/ParagraphSentence/Sentence#1/QuoteStruct/TableStruct/Table/TableRow/TableColumn/Sentence#1`.

Norm kind: **CONDITION** — supplementary-provision table cell classifying an annual amount not exceeding 350 (in units of 10,000 yen), with the amount derived from the fullwidth digits in the verbatim quote. Computable slice: the `<=` threshold over natural-number amounts. CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Annual amount 350 satisfies the condition; amount 351 does not. |
| T | `scripts/ci/transcription_audit.py` whole-law check for LocalTaxEnforcementArt4AnnualAmount350.lean. |
| D | PASS — transcription audit 674/674. |
| C | Only the numeric threshold is modeled. The appended table-row label, surrounding table structure, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/LocalTaxEnforcementArt4AnnualAmount350.lean` — `amountLimit=350` (derived from the source's fullwidth digits), `withinLimit` (<=), five boundary theorems.
- Independent spec: `SpecWithinLimit` as absence of the strict reverse inequality, proved equivalent using Nat-specific core lemmas. All five unit theorems axiom-free; no `decide`/`simp`/`propext`.
- Build: full lake build success (2233 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Appended table-row label, surrounding table structure, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_LOCAL_TAX_ENFORCEMENT_ART4_ANNUAL_AMOUNT_350.md`.
