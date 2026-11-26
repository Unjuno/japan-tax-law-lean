# Unit review — 地方税法 第百五十四条(1) table-cell CONDITION

Normative unit id: `NORM|aada7e0359814b0a7a3a59ef923563944d9083c679e564d3bab228d790ecbabd`

Law: 325AC0000000226 (地方税法), Act. SHA-256 3dd29e00…be68d53.

Verbatim source text (injected from the queue, not hand-typed): 「（１）　乗車定員が三十人以下のもの」

Exact source position: `LawBody[2]/MainProvision/MainProvision[1]/Article:154/Article#154/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1` — a rate-table cell.

Norm kind: **CONDITION** — classification by passenger capacity not exceeding the source threshold (30 persons, read from the kanji numeral in the verbatim quote). Computable slice: the `<=` threshold over natural-number passenger counts. CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Capacity exactly 30 satisfies the condition; capacity above 30 does not. |
| T | `scripts/ci/transcription_audit.py` article-kind check for LocalTaxArt154Capacity30Condition.lean (locator 第百五十四条). |
| D | PASS — transcription audit 654/654. |
| C | Only the numeric threshold is modeled. The surrounding table structure, tax rate, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/LocalTaxArt154Capacity30Condition.lean` — `capacityLimit=30` (derived from the source numeral), `withinLimit` (<=), five boundary theorems.
- Independent spec: `SpecWithinLimit` as absence of the strict reverse inequality, proved equivalent using Nat-specific core lemmas. All five unit theorems axiom-free; no `decide`/`simp`/`propext`.
- Build: full lake build success (2170 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Surrounding table structure, tax rate, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_LOCAL_TAX_ART154_CAPACITY_30_CONDITION.md`.
