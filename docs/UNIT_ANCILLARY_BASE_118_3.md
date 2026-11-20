# Unit review — 国税通則法 art. 118(3) (附帯税の計算基礎の一万円未満切り捨て)

Normative unit id: `NORM|9e261291735bf9c85ed10b49d93d05e9dedfe9dc41133fe3a6b94559edd0b301`
Law: 337AC0000000066 (国税通則法), revision `337AC0000000066_20261101_507AC0000000013`,
enforcement 2026-11-01, snapshot sha256
`6F8B43E168652D228066CDA3389A3BF6823900A9268E6BF97297CB6B25189DEE`.

Verbatim source text: 「附帯税の額を計算する場合において、その計算の基礎となる税額に一万円未満の端数があるとき、又はその税額の全額が一万円未満であるときは、その端数金額又はその全額を切り捨てる。」

Source path (from the persistent queue):
`LawBody[2]/MainProvision/MainProvision[10]/Article:118/Article#118/Paragraph#3/ParagraphSentence/Sentence#1`.
Pinned coverage audit: 345/345 chars reconstructed, exact = true, unique ids = true.

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The fragment locates 附帯税の計算基礎 in art. 118(3); 一万円 = ¥10,000; the rule is a floor to a 10,000-yen unit, distinct from art. 118(1). |
| T (reproduction) | `python scripts/ci/source_audit_ancillary_base_1183.py` — SHA-256 pin, all Paragraph nodes searched, independent kanji parse, art. 118(1) exclusion check. |
| D (decision) | **CONFIRMED** — pin ok; needle in art. 118(3) only; 一万円 = 10,000; art. 118(1) explicitly excludes 附帯税. Transcription fidelity only. |
| C (competing interpretation) | The same ¥10,000 unit appears in art. 120(4) (`RefundRounding.baseForAddition`), and art. 118(1) uses ¥1,000 for 課税標準 but excludes 附帯税. The cross-law theorem in the Spec module proves art. 118(3)'s primitive agrees with art. 120(4) and differs from art. 118(1) at ¥15,000. |
| U (uncertainty) | The kinds and rate of 附帯税 and the determination of the base tax amount are out of scope. No legal-correctness claim; human legal review remains `LEGAL_REVIEW_PENDING`. |

## Model and proof scope

- Implementation: `JapanTaxLaw/AncillaryTaxBaseRoundingUnit.lean` — `roundingUnit = 10000`,
  `baseAmount tax = tax / 10000 * 10000`, plus `baseAmount_eq_zero_of_lt`.
- Independent spec: `JapanTaxLaw/AncillaryTaxBaseRoundingUnitSpec.lean` —
  `specBase tax = tax − tax % 10000`, deliberately a different formulation.
- Kernel proof: `agree_ancillary_base_rounding` proves agreement for **all** `Nat`
  inputs (no finite enumeration). Boundary theorems: `specBase_eq_zero_of_lt`,
  `specBase_le_tax`, and cross-law `cross_law_refund_base` (art. 120(4)).
- Distinctness proof: `distinct_from_art118_1` shows ¥15,000 → ¥10,000 here but
  ¥15,000 under art. 118(1), so this is not a relabelled art. 118(1).
- Tests: `JapanTaxLaw/AncillaryTaxBaseRoundingUnitTests.lean` — 0, 9,999, 10,000,
  10,001, 19,999, 20,000, plus modulo-boundary cases, all `by decide`.

## Not modelled (explicitly retained as unhandled scope)

- The kinds and rates of 附帯税 (延滞税, 加算税, 過怠税, …) and their interaction.
- Determination of the base tax amount (caller-established `tax : Money`).
- art. 118(1)/(2), art. 119(2)-(4), art. 120(1)-(3).
- Human legal review (`LEGAL_REVIEW_PENDING`), kept on a separate axis.

This is a computable slice, not an article-level or law-level completion claim.
