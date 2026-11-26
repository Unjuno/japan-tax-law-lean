# Unit review — 租税特別措置法 第42条の4 EXCEPTION (combined ratio >10%, item-1 carve-out)

Normative unit id: `NORM|54d5aca7a490dd39b948d2eef0911c7833ef5a5fe7fbf89798f9a60d6a9dee0c`

Law: 332AC0000000026 (租税特別措置法), Act. SHA-256 e6e6013b…5cf8d5ee.

Verbatim source text (injected from the queue, not hand-typed): 「合算試験研究費割合が百分の十を超える事業年度（（１）に掲げる事業年度を除く。）」

Exact source position: `LawBody[3]/MainProvision/MainProvision[2]/Article:42_4/Article#42_4/Paragraph#8/Item#9/Subitem1#2/Subitem2#2/Subitem2Sentence/Column#1/Sentence#1`.

Norm kind: **EXCEPTION** (with CONDITION aspect) — business years where the combined R&D expense ratio strictly exceeds 10%, except the years listed in item 1. Computable slice: the strict threshold plus the item-1 carve-out over a two-way year classification. CJK in the quote is byte-verbatim from the pinned source; English prose is descriptive.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Ratio 11% qualifies for a non-item-1 year; ratio 10% does not; item-1 years never qualify. |
| T | `scripts/ci/transcription_audit.py` whole-law check for SpecialMeasuresArt42_4CombinedRatioOver10Exception.lean. |
| D | PASS — transcription audit 697/697. |
| C | Only the threshold and carve-out are modeled. Ratio computation, the definition of item-1 years, and legal correctness are out of scope. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/SpecialMeasuresArt42_4CombinedRatioOver10Exception.lean` — `ratioFloor=10` (derived from the source numeral), `YearClass` (item1/other), `qualifies`, five boundary theorems.
- Independent spec: `SpecQualifies` (absence of reverse non-strict inequality plus equality to non-excluded class) proved equivalent by cases; all five unit theorems axiom-free; no `simp`/`propext`/`omega`.
- Build: full lake build success (2317 jobs); no `sorryAx`/`Classical.choice`.

## Not modelled
Ratio computation, item-1 year definition, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_SPECIAL_MEASURES_ART42_4_RATIO_OVER_10_EXCEPTION.md`.
