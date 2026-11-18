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
| laws with >=1 pinned literal check | 17 | 327 | 5.20% |
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
| references extracted | 476500 |
| internal references checked | 63234 |
| external references NOT bound to the ledger | 175186 |
| references classified unsupported | 250043 |

external_unverified references are NOT verified and are NOT silently counted
as covered scope. Recursive discovery of target laws from reference and
delegation relations remains incomplete; the current ledger was enumerated
by the '税' keyword in the law name only.

## Formalisation axes (denominator = distinct laws / article pins)

| axis | count | denominator | rate |
|---|---:|---:|---:|
| pinned literal checks | 119 | n/a | n/a |
| distinct article pins | 46 | 42584 | 0.11% |
| pinned Lean modules (cross-law) | 364 | n/a | n/a |

## Unaddressed / unproved / candidate-inconsistency axes (Objective §4)

| axis | count |
|---|---:|
| unpinned Lean modules (not counted as verified) | 36 |
| L7 candidates awaiting human legal review | 3438 |
| verified anomalies (requires independent review to establish) | 0 |
| unresolved (unenforced) laws | 2 |
| external references NOT bound to the ledger | 175186 |

An unpinned module, an unreviewed candidate, an unbound reference and an
unenforced law are NOT counted as verified or completed. verified-anomaly = 0
means no independent legal review has established a defect; it is not
evidence of absence of defects.

## Independent transcription-review axis (Objective §4, separate from fidelity-only audit)

| axis | count |
|---|---:|
| adversarial review sessions recorded | 11 |

These are machine-based independent cross-checks by a separate review
agent, NOT human legal review and NOT a count of fully reviewed articles.

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
- `325CO0000000245` 地方税法施行令
- `329AC0000000061` 関税法
- `332AC0000000026` 租税特別措置法
- `332CO0000000043` 租税特別措置法施行令
- `334AC0000000147` 国税徴収法
- `337AC0000000066` 国税通則法
- `340AC0000000033` 所得税法
- `340AC0000000034` 法人税法
- `340CO0000000097` 法人税法施行令
- `342AC0000000023` 印紙税法
- `342AC0000000035` 登録免許税法
- `363AC0000000108` 消費税法
- `403AC0000000069` 地価税法
- `426AC0000000011` 地方法人税法
