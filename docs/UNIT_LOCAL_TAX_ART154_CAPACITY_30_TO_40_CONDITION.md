# Unit review — 地方税法 第百五十四条(1) table-cell CONDITION (>30, <=40)

Normative unit id: `NORM|aa32cf8b9a6339adb0c07216fe43e73857aaea91f64393d2c754d5883c44b9bb`

Law: 325AC0000000226 (地方税法), Act. SHA-256 3dd29e00…be68d53.

Verbatim source text (injected from the queue, not hand-typed): 「（２）　乗車定員が三十人を超え、四十人以下のもの」

Exact source position: `LawBody[2]/MainProvision/MainProvision[1]/Article:154/Article#154/Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1`.

Norm kind: **CONDITION** — table-cell interval classification: passenger capacity strictly above 30 and not above 40. Both bounds are derived from the kanji numerals in the verbatim quote. Computable slice: the half-open interval over natural-number passenger counts. CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Capacity 31 and 40 qualify; capacity 30 and 41 do not. |
| T | `scripts/ci/transcription_audit.py` article-kind check for LocalTaxArt154Capacity30To40Condition.lean (locator 第百五十四条). |
| D | PASS — transcription audit 663/663. |
| C | Only the interval is modeled. Surrounding table structure and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/LocalTaxArt154Capacity30To40Condition.lean` — `lowerBound=30` (strict), `upperBound=40` (inclusive), `withinInterval`, seven boundary theorems.
- Independent spec: `SpecWithinInterval` as absence of the two complementary inequalities, proved equivalent; equivalence uses Nat-specific core lemmas and concrete `decide` reductions (probe-confirmed axiom-free). All seven unit theorems axiom-free; no simp/propext/omega.
- Build: full lake build success (2209 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Surrounding table structure, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_LOCAL_TAX_ART154_CAPACITY_30_TO_40_CONDITION.md`.
