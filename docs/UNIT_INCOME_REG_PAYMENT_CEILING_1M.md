# Unit review — 所得税法施行規則 art.87(3)(2)（満期返戻金等の支払金額百万円以下）

Normative unit id: `NORM|527ed759ab3fbc4580c09c7b5631fa02674c97e617ae168ed0d0e85a313df13a`

Law: 340M50000040011 (所得税法施行規則), MinisterialOrdinance, revision
`340M50000040011_20261001_507M60000040018`, snapshot
`data/raw/340M50000040011_20261001_507M60000040018.law.json`, sha256
`8721699516ac82025eea0430429b197da1e58afe195debe1fb441dfea14eacf5`.

Verbatim source text: 「同一人に対するその年中の満期返戻金等の支払金額が百万円以下である場合」
(verbatim-unique in the whole law). Kind: **CONDITION** — payment amount
<= ¥1,000,000 (以下 inclusive upper bound).

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | This item defines a payment ceiling: 満期返戻金等の支払金額 <= ¥1,000,000 (以下, inclusive). |
| T (reproduction) | `python scripts/ci/transcription_audit.py` pin 「所得税法施行規則 art.87(3)(2)…↔ IncomeRegPaymentCeiling1M.lean」 law 340M50000040011, article 第八十七条; needle unique. Full audit: 246/246 passed. |
| D (decision) | PASS — needle located uniquely in scoped Article 第八十七条. |
| C (competing interpretation) | Reading 以下 as strict `<` would reject exactly ¥1,000,000; the kernel theorem `ceiling_inclusive` rejects that reading. |
| U (uncertainty) | Transcription fidelity only, not legal correctness. The classification of 満期返戻金等, the gated reporting obligation and 同一人 identity require human legal review (`LEGAL_REVIEW_PENDING`). |

## Model and proof scope

- Impl: `paymentCeiling=1_000_000`, `withinPaymentCeiling a := decide (a <= paymentCeiling)`.
- Independent spec: `specWithinPayment a := decide (¬ specPaymentCeiling < a)` (negated strict order — distinct operator); universal `agree_payment_ceiling` over all Nat, kernel-checked with `by omega`.
- Boundary theorems: `ceiling_inclusive` (1M qualifies), `first_above` (1,000,001 fails), `zero_true`.
- Tests: 11 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

## Not modelled (explicitly retained as unhandled scope)

The classification of 満期返戻金等, the reporting obligation gated by this
condition, 同一人 identity, other items/paragraphs and enforcement rules. This
is a computable slice of one CONDITION norm unit, not an article-level claim.

## Adversarial review

See `docs/adversarial/reviews-income-reg-payment-ceiling-1m.md` (H/T/D/C/U per
check). No legal correctness is claimed; human legal review remains pending.
