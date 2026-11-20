# Normative units — 337M50000008017 附則14の9(3)（農業点数の三段階式）

Three units from the pinned revision `337M50000008017_20260724_508M60000008092`,
the ArithFormula fragments of Supplementary Provision 14-9(3):

| index | normative id (prefix) | 原文 |
|---|---|---|
| 0 | `NORM\|f9c00cec…` | ｍ１≦２，０００のとき　ｍ１×０．０３ |
| 1 | `NORM\|a1870a9b…` | ２，０００＜ｍ１≦７，０００のとき　（ｍ１－２，０００）×０．０８＋６０ |
| 2 | `NORM\|f083f7ca…` | ７，０００＜ｍ１のとき　（ｍ１－７，０００）×０．１＋４６０ |

| id | content |
|---|---|
| H | The three branches partition m1 and compute 0.03 / 0.08 / 0.1 rates. Represented exactly in hundredths (×3 / ×8 / ×10 with fixed denominator 100). The branches are continuous at 2,000 (60.00) and 7,000 (460.00) and non-decreasing within each band. |
| T | `lake build JapanTaxLaw.ProgressiveAgriculturalPointsTests`; `python scripts/ci/source_audit_progressive_points.py` |
| D | Kernel theorems `continuous_at_2000`, `continuous_at_7000`, `band_monotone`, plus band exclusivity/exhaustiveness, spec agreement and all three formulas verbatim (3/3 hits). |
| C | Competing reading rejected: treating 0.03/0.08/0.1 as floating point introduces boundary error; the hundredths encoding is exact. Also rejected: assuming the 四捨五入 rule from the neighbouring sentence belongs to these fragments — it is a separate norm and NOT modelled here. |
| U | d (m1) is caller-established; deriving m1 from m2/m3, the 四捨五入 rounding, and the rest of article 14-9 are NOT MODELLED. Human legal review pending. |

This verifies three formula fragments and their boundary consistency, not the
whole article or any tax computation.
