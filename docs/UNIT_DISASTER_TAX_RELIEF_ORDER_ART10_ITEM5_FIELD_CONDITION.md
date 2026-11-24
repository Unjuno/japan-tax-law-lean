# Unit review — 災害被害者租税減免法施行政令 第十条(1) 第五号 CONDITION

Normative unit id: `NORM|776e380c19760249d8df0f9271e451ace26d44c8f044d76495f3caeb888f038d`

Law: 322CO0000000268 (災害被害者に対する租税の減免、徴収猶予等に関する法律の施行に関する政令), **CabinetOrder (政令)**. SHA-256 f6fe1c93…a66a21c.

Verbatim source text (injected from the queue, not hand-typed): 「徴収猶予限度額又は徴収猶予期間及びこれらの計算の基礎」

Exact source position: `LawBody[1]/MainProvision/MainProvision[10]/Article:10/Article#10/Paragraph#1/Item#5/ItemSentence/Sentence#1` — item 5 of the application-form required entries listed in Article 10(1).

Norm kind: **CONDITION** — item 5 requires the applicant to enter the deferral limit amount OR the deferral period, AND the basis for calculating them. Computable slice: the field-completeness condition (又は disjunction, 及び conjunction). All statutory facts derived from the needle; no hand-typed CJK.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | Item 5 is satisfied by (limit amount OR deferral period) AND calculation basis; amount-only or basis-only is insufficient. |
| T | `scripts/ci/transcription_audit.py` article-kind check for DisasterTaxReliefOrderArt10Item5FieldCondition.lean. |
| D | PASS — transcription audit 524/524. |
| C | Only the item-5 field-completeness condition is modeled. The full application form, substantive deferral eligibility, and legal correctness are out of scope; field entries are caller-established. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/DisasterTaxReliefOrderArt10Item5FieldCondition.lean` — `DeferralField` (limitAmount/deferralPeriod/calculationBasis), `satisfiesItem5`, four provider boundary theorems.
- Independent spec: `SpecItem5` Prop conjunction/disjunction, representationally distinct; spec and agreement theorems axiom-free (rfl/And.intro/Or.inr/cases).
- Build: full lake build success (1729 jobs); all eight unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Full application form, substantive eligibility, legal correctness — all NOT MODELLED.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced. The reference to 法第三条第五項 in the enclosing paragraph is outside this unit's needle and is NOT MODELLED here.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_DISASTER_TAX_RELIEF_ORDER_ART10_ITEM5_FIELD_CONDITION.md`.
