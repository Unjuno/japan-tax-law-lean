# Independent original-text audit — DisasterIncomeThreshold (2026-11-20)

This audit is independent of the Lean kernel proof: it reads the pinned e-Gov
snapshot, verifies the SHA-256 pin, locates the verbatim fragment in the article
tree and records the H/T/D/C/U finding required by Objective §5.

## Provenance

- Norm unit: `NORM|89a8b5e3962e7db358a45105bea6669582c82591554b65860296e9fc58cc71cf`
- Law: `322AC0000000175` 災害被害者に対する租税の減免、徴収猶予等に関する法律
- Revision: `322AC0000000175_20220101_503AC0000000011`, enforced 2022-01-01
- Snapshot: `data/raw/322AC0000000175_20220101_503AC0000000011.law.json`
- Measured SHA-256: `C3BB5B0BDFFBDEFD2EE5F358D90AD9E0922D4C887ECB2B133AA7D613F5F4E7EF`
  (identical to the pin in `JapanTaxLaw/DisasterIncomeThreshold.lean`)

## Reproduction (measured output)

```
python scripts/ci/source_audit_disaster_income.py
"sha256_pin_ok": true
"articles_containing_needle": [ "2" ]
"finding"."D": "CONFIRMED"
"completion_status_promoted": false
```

The verbatim fragment `合計所得金額が五百万円以下であるとき` occurs in the
pinned snapshot, uniquely inside article 2, and the model's
`threshold : Money := 5_000_000` matches the kanji numeral 五百万円. The spec
states the same condition as `¬ threshold < income`; a universal, kernel-checked
theorem proves their equivalence. Boundary examples at 5,000,000 and 5,000,001
are labelled as examples, not used as the proof.

## Finding SRC-DIT-1 (scope uniqueness — CONFIRMED for the pinned revision)

| field | value |
|---|---|
| H (falsifiable hypothesis) | The verbatim threshold fragment occurs only in art. 2(1) of this law. |
| T (reproduction test) | Searched every `Article` node of the pinned snapshot for the normalized needle. |
| D (decision) | **CONFIRMED** — exactly one article (art. 2) contains the fragment. |
| C (competing interpretation) | The fragment is unique in this revision; other revisions/bands are out of scope. |
| U (uncertainty) | Scope beyond the pinned revision requires independent legal review. |

**Measurement consequence:** the unit is pinned by article number and exact
source span, not by the fragment string. The implementation explicitly declares
its scope to the ¥5,000,000 first-band condition and excludes the 千万円 overall
ceiling, the computation of 合計所得金額 (所得税法 art. 22), the other bands and
政令 details. This is a computable-slice claim, not article- or law-level
completion.

## Status

- Original-text correspondence: **CONFIRMED** (pin hash + fragment + article 2).
- Human legal review: `LEGAL_REVIEW_PENDING` (separate axis, untouched).
- This audit records evidence; it does not itself promote a completion status.
