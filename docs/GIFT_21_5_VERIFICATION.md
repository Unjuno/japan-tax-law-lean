# Verification record — 相続税法 art. 21の5 (gift-tax basic deduction)

Normative unit: `NORM|167b8cabf184adb595d75baba5ffbf319ec3c502be8a820858e8c493b09f57d7`
Pinned source: `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`
Source SHA-256: `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`
Enforced revision: `325AC0000000073_20260401_506AC0000000008`, 2026-04-01.

This record covers ONE normative unit. It is not a statement about the whole
article, the whole law, or the correctness of Japanese tax law.

## 1. Source (independent extraction)

An independent walk of the pinned JSON (not the queue generator) finds:

```
（贈与税の基礎控除）第二十一条の五 贈与税については、課税価格から六十万円を控除する。
```

The unit text is located verbatim in Article `21_5` Paragraph 1 Sentence 1:
`LawBody[3]/MainProvision/MainProvision[1]/Article:21_5/Article#21_5/Paragraph#1/ParagraphSentence/Sentence#1`.

## 2. Source ↔ specification correspondence (Lean-independent)

Command:
```
python scripts/ci/source_correspondence.py --unit NORM|167b... \
  --source-file data/raw/325AC0000000073_20260401_506AC0000000008.law.json \
  --article 21_5 --verbatim '贈与税については、課税価格から六十万円を控除する。' \
  --spec JapanTaxLaw/GiftTaxSpec.lean --impl JapanTaxLaw/GiftTax.lean
```

Measured result: `D=PASS`, `verbatim_located=true`, `amounts_in_source=[600000]`,
`missing_in_spec=[]`, `missing_in_impl=[]`.

H: the formal spec does not represent the amount in the pinned original.
T: re-extract the article from the pinned JSON, parse 漢数字 (`六十万` → 600000),
   and compare with the Lean constants.
D: PASS for the amount and the verbatim location only.
C: a matching numeral is necessary but not sufficient for semantic fidelity;
   the meaning of 課税価格 and the interaction with other deductions remain
   caller-established (documented in `GiftTax.lean`).
U: legal interpretation requires human review.

## 3. Implementation, spec, tests and kernel result

| artifact | file | SHA-256 |
|---|---|---|
| implementation | `JapanTaxLaw/GiftTax.lean` | `d6143c80188db2c66ffb397a3b84f38dd53c64e7333862141205a9e0fb9435fd` |
| independent spec | `JapanTaxLaw/GiftTaxSpec.lean` | `453d34aa1fb94ddd81fc9cb27978b695836998c4cbd60cf3c4c7196daf32fb4f` |
| tests | `JapanTaxLaw/GiftTaxTests.lean` | `725c5b29a5cb14f99245c2f37a386cab37151754ca2c5390c61ab849f157a839` |

Commands and exact output:

```
$ C:\Users\user\.elan\bin\lake.exe build JapanTaxLaw.GiftTaxSpec
✔ [3/4] Built JapanTaxLaw.GiftTax (6.7s)
✔ [4/4] Built JapanTaxLaw.GiftTaxSpec (14s)
Build completed successfully (4 jobs).

$ C:\Users\user\.elan\bin\lake.exe build JapanTaxLaw.GiftTaxTests
Build completed successfully (4 jobs).

$ C:\Users\user\.elan\bin\lake.exe env lean gift_axioms.lean
'JapanTaxLaw.giftTax_zero_below_deduction' does not depend on any axioms
'JapanTaxLaw.giftPortionTax_zero' does not depend on any axioms
'JapanTaxLaw.agreeGiftTax' does not depend on any axioms
'spec_impl_basic_deduction_agree' does not depend on any axioms
```

A source scan of the three modules found no `sorry`, `admit` or `axiom`.
The spec/implementation correspondence `agreeGiftTax` is grid-based (51 points),
not a universal proof over all inputs; it is recorded as `PROVED_SCOPE` evidence,
not as a universal theorem about the article.

## 4. Adversarial review (separate from the implementer)

- H: the model treats the deduction as a flat 600,000 yen subtraction and
  silently ignores the 課税価格 definition or other deductions.
- T: re-read art. 21-5 verbatim; inspect `giftTax` and `specBasicDeduction`;
  check the queue unit's dependency list for cross-law references.
- D: the unit's norm text is exactly the deduction sentence; both impl and spec
  encode 600,000; `giftTax` applies the deduction before the art. 21-7 bands;
  dependencies for this unit are empty. The documented limits (課税価格 is
  caller-established; art. 21-6/21-9/21-13 not modelled) are explicit in
  `GiftTax.lean`, so no hidden universal claim is made.
- C: an alternative reading could apply the deduction after rate computation;
  the pinned sentence says 課税価格から控除する, so deduction-before-rate is the
  supported reading for this unit.
- U: the boundary behaviour when 課税価格 < 600,000 is encoded as a saturating
  zero by `if x ≤ giftBasicDeduction then 0`; the statute does not explicitly
  state the negative case, so this remains a model choice requiring review.

## 5. Scope of this record

This record supports the `kernel_proof`, `boundary_proof`, `proof_scope`,
`cross_law_proof`, `tests`, `adversarial_review` and
`source_correspondence_audit` evidence axes for this ONE unit. Human legal
review remains pending and is not implied by any result above.
