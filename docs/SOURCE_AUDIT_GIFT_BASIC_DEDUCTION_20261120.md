# Independent original-text audit — GiftBasicDeductionUnit (2026-11-20)

This audit is independent of the Lean kernel proof. It checks that the typed
specification corresponds to the pinned original text, and records the
H / T / D / C / U tuple required by Objective §5.

## Provenance

- Norm unit: `NORM|52ff866ebec866122bfcf42be9c0fbc69d8bbea9d64fe5975a5e4d7225790ba7`
- Law: `325AC0000000073` 相続税法, revision `325AC0000000073_20260401_506AC0000000008`
- Snapshot: `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`
- Measured SHA-256: `C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7`
  (identical to the pin inside `JapanTaxLaw/GiftBasicDeductionUnit.lean`)

## Reproduction (measured output)

```
python scripts/ci/source_audit_gift_basic_deduction.py
"sha256_pin_ok": true
"needle_in_full_text": true
"articles_containing_needle": [ "21_11_2", "21_5" ]
"finding"."D": "REFUTED"
"completion_status_promoted": false
```

The verbatim fragment `課税価格から六十万円を控除する` occurs in the pinned
snapshot, and the model's `basicDeduction : Money := 600_000` matches the kanji
numeral 六十万円. The Lean spec (`min` form) and the implementation (branch
form) are connected by a universal, kernel-checked theorem
`agree_gift_basic_deduction`; the finite smoke test is explicitly labelled as
such and is not used as the proof.

## Finding SRC-GBD-1 (scope ambiguity — recorded, not a defect claim)

| field | value |
|---|---|
| H (falsifiable hypothesis) | The verbatim fragment alone uniquely identifies art. 21-5. |
| T (reproduction test) | Searched all `Article` nodes of the pinned snapshot for the normalised needle. |
| D (decision) | **REFUTED** — the needle occurs in **two** articles: `21_5` and `21_11_2`. |
| C (competing interpretation) | The fragment also appears in art. 21-11-2 (相続時精算課税); a text-only pin cannot distinguish them. |
| U (uncertainty) | Whether art. 21-11-2's occurrence changes this unit's effect requires legal review. |

**Consequence for the measurement model:** this confirms why completion must
not be derived from a text/numeric match. The unit's identity and source
position carry the article number `21_5` and the exact source span, not merely
the needle. The implementation explicitly declares its scope to the ¥600,000
deduction of art. 21-5 and excludes art. 21-9/21-13; the duplicate occurrence
is recorded here as an unresolved competing interpretation rather than silently
ignored. This is a computable-slice claim, not an article-level or law-level
completion claim.

## Status

- Original-text correspondence for the pinned fragment: **CONFIRMED** (exact
  snapshot hash + fragment + article 21-5 position).
- Scope ambiguity: **RECORDED (SRC-GBD-1)**, requires independent legal review.
- Machine verification status of the unit: unchanged (`NOT_STARTED`/slice); this
  audit is evidence, not a completion promotion.
- Human legal review: `LEGAL_REVIEW_PENDING` (separate axis, untouched).
