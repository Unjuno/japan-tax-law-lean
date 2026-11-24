# Unit review — 相続税法 第二十一条の十六(3) 第一号 EFFECT

Normative unit id: `NORM|f700e89529600c036887cb663aa17cca3e9d41bf656bbb9ca383e8a6da537af4`

Law: 325AC0000000073 (相続税法), Act. SHA-256 c01bb9be…5043a7.

Verbatim source text (injected from the queue, not hand-typed): 「当該財産の価額は、第一項の贈与の時における価額とする。」

Exact source position: `LawBody[3]/MainProvision/MainProvision[1]/Article:21_16/Article#21_16/Paragraph#3/Item#1/ItemSentence/Sentence#1` — whole-law locator used (article title lookup ambiguous for auxiliary articles).

Norm kind: **EFFECT** — 当該財産の価額 (the value of the asset) is 第一項の贈与の時における価額 (the value at the time of the paragraph-1 gift). Computable slice: the valuation-time selection (gift time, not another time). All statutory terms derived programmatically from the needle; no hand-typed CJK.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The asset value is fixed at the gift time, not at another valuation time. |
| T | `scripts/ci/transcription_audit.py` whole-law check for InheritanceTaxArt21_16GiftTimeValuation.lean. |
| D | PASS — transcription audit 581/581. |
| C | Only the valuation-time selection is modeled. The substantive valuation method, the selection of the asset, and legal correctness are out of scope; actual value is caller-established. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/InheritanceTaxArt21_16GiftTimeValuation.lean` — `ValuationTime` (giftTime/other), `valuationTime=giftTime`, two boundary theorems.
- Independent spec: `SpecValuationTime` Prop equality, representationally distinct; implementation/other theorems axiom-free (rfl, cases).
- Build: full lake build success (1882 jobs); all four unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Substantive valuation method, asset selection, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_INHERITANCE_TAX_ART21_16_GIFT_TIME_VALUATION.md`.
