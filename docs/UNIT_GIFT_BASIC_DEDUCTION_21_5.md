# Unit review — 相続税法 art. 21-5 (¥600,000 gift-tax basic deduction)

Normative unit id: `NORM|52ff866ebec866122bfcf42be9c0fbc69d8bbea9d64fe5975a5e4d7225790ba7`
Law: 325AC0000000073 (相続税法), revision `325AC0000000073_20260401_506AC0000000008`,
enforcement 2026-04-01, snapshot sha256
`C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7`.

Verbatim source text: 「贈与税については、課税価格から六十万円を控除する。」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H (refutable hypothesis) | The model's constant is 600,000 yen and is deducted from the gift-tax taxable base. |
| T (reproduction) | `scripts/ci/transcription_audit.py` check 「相続税法 art. 21-5 … 六十万円」; needle 「課税価格から六十万円を控除する」 searched against the pinned article text. |
| D (decision) | PASS — needle found in the pinned article; see the transcription-audit output in the CI log. |
| C (competing interpretation) | The ¥600,000 figure could belong to art. 21-6 (spouse deduction) or to art. 21-12 (¥25,000,000). The article-scoped diagnostic places this needle in art. 21-5, not those articles. **Adversarial addendum (independent re-scan):** the same needle also occurs in art. `21_11_2` as a cross-reference to the basic deduction, so needle uniqueness is falsified; see `docs/ADVERSARIAL_FINDING_GIFT_BASIC_21_5.md`. |
| U (uncertainty) | This is a transcription-fidelity decision, not legal correctness; the determination of 課税価格 and the interaction with art. 21-6/21-9/21-13 are out of scope. |

## Model and proof scope

- Implementation: `JapanTaxLaw/GiftBasicDeductionUnit.lean` — `basicDeduction : Money := 600_000`,
  `taxableBaseAfterDeduction` saturating at zero.
- Independent spec: `JapanTaxLaw/GiftBasicDeductionUnitSpec.lean` — `specDeducted = min base deduction`,
  `specResult = base - specDeducted`, deliberately a different formulation.
- Kernel proof: `agree_gift_basic_deduction` proves equality for **all** `Nat` inputs
  (no finite enumeration), plus `specResult_eq_zero_of_le` and `specResult_le_base`.
- Cross-law: `cross_law_constant` checks the same ¥600,000 constant against the
  pre-existing `JapanTaxLaw.giftBasicDeduction` (art. 21-7 model).
- Test: `JapanTaxLaw/GiftBasicDeductionUnitTests.lean` — boundary values 0, 599999,
  600000, 600001, 1200000, all kernel-decided.

## Not modelled (explicitly retained as unhandled scope)

Art. 21-2〜21-4 課税価格 calculation; art. 21-6 配偶者控除; art. 21-9 相続時精算課税;
art. 21-13 flat 20%; the art. 21-7 rate table. This unit is a computable slice, not
an article-level completion claim. Human legal review remains LEGAL_REVIEW_PENDING.
