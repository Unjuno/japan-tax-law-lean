# Dimension / unit annotation audit (machine-generated)

Do not hand-edit. Regenerate with `scripts/ci/dimension_audit.py`.

Independent of Lean: checks that a statutory unit appearing in the
original text is documented in the corresponding Lean model.
This is documentation/consistency only, NOT a proof and NOT a claim of
legal correctness.

- units checked: 689
- unit findings: 136
- documented: 92 / undocumented: 44
- all-complete claimable: False

| statutory unit | documented | undocumented |
|---|---:|---:|
| 人 | 37 | 5 |
| 円 | 24 | 5 |
| 回 | 0 | 1 |
| 平方メートル | 1 | 1 |
| 年 | 18 | 9 |
| 月 | 3 | 20 |
| 百分 | 9 | 3 |

## Undocumented findings (H/T/D/C/U in JSON)

- `NORM|15ab667908d0c90` unit `月` — the statute states months but the model does not document a month domain
- `NORM|18ab43d899bb6c2` unit `百分` — the statute states a percentage but the model does not document a rate unit
- `NORM|1ee25979810e9fa` unit `人` — the statute states a person count but the model does not document it
- `NORM|1fb5c9026867f71` unit `百分` — the statute states a percentage but the model does not document a rate unit
- `NORM|2087bdd74d4dd87` unit `月` — the statute states months but the model does not document a month domain
- `NORM|2087bdd74d4dd87` unit `年` — the statute states years but the model does not document a year domain
- `NORM|2087bdd74d4dd87` unit `回` — the statute states a per-occurrence unit but the model does not document it
- `NORM|20e0a70dd670b04` unit `円` — the statute states an amount in yen but the model does not document a monetary unit
- `NORM|288a1bc7b19ce56` unit `月` — the statute states months but the model does not document a month domain
- `NORM|2d8efda008ac99c` unit `百分` — the statute states a percentage but the model does not document a rate unit
- `NORM|458dbd73739145e` unit `月` — the statute states months but the model does not document a month domain
- `NORM|458dbd73739145e` unit `年` — the statute states years but the model does not document a year domain
- `NORM|4d12cdbb98871c6` unit `月` — the statute states months but the model does not document a month domain
- `NORM|4f26a35b282c2b3` unit `月` — the statute states months but the model does not document a month domain
- `NORM|4f26a35b282c2b3` unit `年` — the statute states years but the model does not document a year domain
- `NORM|5090df0abb50227` unit `月` — the statute states months but the model does not document a month domain
- `NORM|5090df0abb50227` unit `年` — the statute states years but the model does not document a year domain
- `NORM|53598af2c8fa665` unit `月` — the statute states months but the model does not document a month domain
- `NORM|53598af2c8fa665` unit `年` — the statute states years but the model does not document a year domain
- `NORM|5f7dcac3c1f7eda` unit `月` — the statute states months but the model does not document a month domain
- `NORM|5f7dcac3c1f7eda` unit `年` — the statute states years but the model does not document a year domain
- `NORM|649043b68954496` unit `円` — the statute states an amount in yen but the model does not document a monetary unit
- `NORM|69bb7c420bf7131` unit `円` — the statute states an amount in yen but the model does not document a monetary unit
- `NORM|69bb7c420bf7131` unit `月` — the statute states months but the model does not document a month domain
- `NORM|6c27d6682b02b54` unit `月` — the statute states months but the model does not document a month domain
- `NORM|744e9506f9f6980` unit `人` — the statute states a person count but the model does not document it
- `NORM|856c263d19f7b82` unit `月` — the statute states months but the model does not document a month domain
- `NORM|856c263d19f7b82` unit `人` — the statute states a person count but the model does not document it
- `NORM|8746221ba199786` unit `月` — the statute states months but the model does not document a month domain
- `NORM|8e7f2e7760ab181` unit `月` — the statute states months but the model does not document a month domain
- ... and 14 more
