# Unit review — 災害被害者租税減免法施行政令 第十五条の四(1) 二号 EFFECT

Normative unit id: `NORM|beaa62718d9817915074146fe618eb76b36fa3647c372ba793c4f2a85d27d58e`

Law: 322CO0000000268 (災害被害者に対する租税の減免、徴収猶予等に関する法律の施行に関する政令), **CabinetOrder (政令)**. SHA-256 f6fe1c93…a66a21c.

Verbatim source text (injected from the queue, not hand-typed): 「還付を受けようとする自動車重量税の額に相当する金額」

Exact source position: `LawBody[1]/MainProvision/MainProvision[19]/Article:15_4/Article#15_4/Paragraph#1/Item#2/ItemSentence/Sentence#1` — Item 2 flat text is 「二還付を受けようとする自動車重量税の額に相当する金額」.

Norm kind: **EFFECT** — an amount definition: the base is the amount corresponding to the automobile weight tax sought to be refunded. Computable slice: the amount correspondence as an identity on a Nat amount (unit: yen). All statutory facts derived from the needle; no hand-typed CJK.

## Source correspondence (independent of Lean)
| field | value |
|---|---|
| H | The base amount equals the automobile weight tax amount sought to be refunded (identity correspondence). Zero tax amount gives zero base. |
| T | `scripts/ci/transcription_audit.py` article-kind check for DisasterTaxReliefOrderArt15_4RefundBase.lean. |
| D | PASS — transcription audit 479/479. |
| C | Only the amount correspondence is modeled. Refund eligibility, the underlying tax computation, and legal correctness are out of scope. The tax amount is caller-established. |
| U | Human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope
- Implementation: `JapanTaxLaw/DisasterTaxReliefOrderArt15_4RefundBase.lean` — `refundBaseAmount` identity Nat function, universal and zero-boundary theorems.
- Independent spec: `SpecRefundBase` Prop equality, representationally distinct; `implementation_satisfies_spec` axiom-free (rfl).
- Build: full lake build success (1576 jobs); all three unit theorems axiom-free; no `sorryAx`/`Classical.choice`.

## Not modelled
Refund eligibility, tax computation, legal correctness.

## Dependencies (honest)
The queue records no dependencies for this unit; no cross-law constant introduced. The reference to 自動車重量税 is a subject-matter description in the amount definition, NOT MODELLED as a resolved cross-law dependency.

## Adversarial review
Independent findings recorded in `docs/ADVERSARIAL_DISASTER_TAX_RELIEF_ORDER_ART15_4_REFUND_BASE.md`.
