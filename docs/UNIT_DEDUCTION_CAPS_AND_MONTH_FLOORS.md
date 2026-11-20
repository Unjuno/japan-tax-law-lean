# Normative units — 325AC0000000226（控除上限・月数下限）

Eight units from the pinned revision `325AC0000000226_20261101_508AC0000000002`:

| group | count | 原文 | source coordinates |
|---|---|---|---|
| months | 6 | この場合における月数は、暦に従い計算し、一月に満たないときは一月とし、一月に満たない端数を生じたときは切り捨てる。 | art.72_21 paragraphs 3/4/5/8/9/10 |
| caps | 2 | この場合において、当該控除額が当該所得割の額を超えるときは、当該控除額は、当該所得割の額に相当する金額とする。 | art.37の2(1), art.314の7(1) |

| id | content |
|---|---|
| H | The month rule is a lower bound: effective months = 1 if m = 0, else m. The cap rule is an upper bound: allowable deduction = liability if liability <= deduction, else deduction. Both are saturating maps with bounds, monotonicity and idempotence; when liability >= 1 the two commute. |
| T | `lake build JapanTaxLaw.DeductionCapsAndMonthFloorsTests`; `python scripts/ci/source_audit_caps_floors.py` |
| D | Kernel theorems for bounds, monotonicity, idempotence and `cap_and_floor_commute`, plus spec agreement; verbatim audit confirms 6 month + 2 cap occurrences (5/5 checks). |
| C | Competing reading rejected: treating 「一月に満たない」 as "round to zero" or the cap as applying unconditionally would break the bounds. The 四捨五入/暦計算 details are caller-supplied `m`, NOT part of these fragments. |
| U | m / deduction / liability are caller-established Nat; calendar computation, fractional truncation, the surrounding tax computations and articles are NOT MODELLED. Human legal review pending. |

Rule interaction (§3) is verified for the two saturating maps, not whole articles.
