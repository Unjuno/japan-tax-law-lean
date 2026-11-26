# Unit review — 地方税法施行規則 附則 第四条 table-cell CONDITION (350万 < amount <= 700万)

Normative unit id: `NORM|0a52a8975d92d2968ed4d24f279f8b5e8e432b8486f46e012d95bd6d5f5186de`

Law: 329M50000002023 (地方税法施行規則), MinisterialOrdinance. SHA-256 5ffb833b…bb217e.

Verbatim source text (injected from the queue, not hand-typed): 「年３５０万円を超え年７００万円以下の金額　（（２２））」

Exact source position: `LawBody[79]/SupplProvision/SupplProvision[4]/Article:4/Article#4/Paragraph#2/ParagraphSentence/Sentence#1/QuoteStruct/TableStruct/Table/TableRow/TableColumn/Sentence#1`.

Norm kind: **CONDITION** — supplementary-provision table cell classifying an annual amount strictly above 350 (万円) and not above 700 (万円), with both bounds derived from the fullwidth digits in the verbatim quote. Computable slice: the half-open interval over natural-number amounts. CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Amounts 351 and 700 qualify; amounts 350 and 701 do not. |
| T | `scripts/ci/transcription_audit.py` whole-law check for LocalTaxEnforcementArt4AnnualAmount350To700.lean. |
| D | PASS — transcription audit 694/694. |
| C | Only the interval is modeled. The appended table-row label, surrounding table structure, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/LocalTaxEnforcementArt4AnnualAmount350To700.lean` — `lowerBound=350` (strict), `upperBound=700` (inclusive), `withinInterval`, seven boundary theorems.
- Independent spec: `SpecWithinInterval` as absence of the two complementary inequalities, proved equivalent; equivalence uses Nat-specific core lemmas and concrete `decide` reductions (probe-confirmed axiom-free). All seven unit theorems axiom-free; no simp/propext/omega.
- Build: full lake build success (2305 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Appended table-row label, surrounding table structure, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_LOCAL_TAX_ENFORCEMENT_ART4_AMOUNT_350_TO_700.md`.
