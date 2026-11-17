# Coverage ledger (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/coverage_ledger.py`.
Every number below is computed from a machine-generated input. Axes have
DIFFERENT denominators and are deliberately NOT combined into a completion
percentage. Reading a law into the corpus is not semantic modelling; a
fidelity-only literal check is not legal review.

snapshot_date: 2026-11-15
objective_baseline_date: 2026-11-17 (JST; as stated in the directive)

## Law-level axes (denominator = laws in INVENTORY)

| axis | count | denominator | rate |
|---|---:|---:|---:|
| laws in ledger | 327 | 327 | 100.00% |
| current-enforced (auditable) laws | 324 | 327 | 99.08% |
| laws with pinned raw snapshot | 325 | 327 | 99.39% |
| laws with >=1 pinned literal check | 13 | 327 | 3.98% |
| unresolved (unenforced) laws | 2 | 327 | 0.61% |

## Structural sweep axes (denominator = structural units checked)

| axis | count |
|---|---:|
| laws parse-ok | 325 |
| laws audit-ok | 325 |
| articles checked | 42584 |
| paragraphs checked | 86403 |
| items checked | 61672 |
| verified anomalies | 0 |
| unreviewed candidates | 3438 |

## Reference-relation axes (Objective §1 — recursive discovery)

| axis | count |
|---|---:|
| references extracted | 461067 |
| internal references checked | 81779 |
| external references NOT bound to the ledger | 161664 |
| references classified unsupported | 237132 |

external_unverified references are NOT verified and are NOT silently counted
as covered scope. Recursive discovery of target laws from reference and
delegation relations remains incomplete; the current ledger was enumerated
by the '税' keyword in the law name only.

## Formalisation axes (denominator = distinct laws / article pins)

| axis | count | denominator | rate |
|---|---:|---:|---:|
| pinned literal checks | 93 | n/a | n/a |
| distinct article pins | 46 | 42584 | 0.11% |
| pinned Lean modules (cross-law) | 293 | n/a | n/a |

## Human legal review axis (denominator = L7 candidates)

| axis | count | denominator | rate |
|---|---:|---:|---:|
| candidates with recorded reviewer | 0 | 3438 | 0.00% |
| candidates with recorded review_date | 0 | n/a | n/a |

verified-anomaly = 0 means zero independent legal review has established
any candidate as an anomaly; it is NOT evidence that no defect exists.

## Laws with pinned literal checks

- `143AC0000000054` 関税定率法
- `325AC0000000073` 相続税法
- `325AC0000000226` 地方税法
- `329AC0000000061` 関税法
- `332AC0000000026` 租税特別措置法
- `332CO0000000043` 租税特別措置法施行令
- `337AC0000000066` 国税通則法
- `340AC0000000033` 所得税法
- `340AC0000000034` 法人税法
- `340CO0000000097` 法人税法施行令
- `342AC0000000023` 印紙税法
- `342AC0000000035` 登録免許税法
- `363AC0000000108` 消費税法
