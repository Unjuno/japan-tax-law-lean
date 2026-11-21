# Normative units — 金額・割合・小数（1,853 units, PROVED_SCOPE）

These 1,853 fragments have 原文 consisting only of a numeric token, so the
decomposer recorded them as UNRESOLVED. Only the numeric parse is kernel-proven;
unhandled conditions are retained and all units derive `PROVED_SCOPE`, never
`FULLY_VERIFIED`.

| family | units | structure |
|---|---|---|
| amount_yen | 974 | 二十万円, 七千五百円, 円 etc. — kanji amount with 万/千/百/十 multipliers |
| percentage | 439 | 百分の十 etc. — numerator over 100 |
| decimal | 440 | 一・二 etc. — (integer part, fractional part) pair |

| id | content |
|---|---|
| H | A kanji amount parses to a Nat using 万=10⁴, 千=10³, 百=10², 十=10 multipliers; a percentage is the numerator over 100; a decimal is a pair of kanji digit groups. |
| T | `lake build JapanTaxLaw.NumericFragmentsTests`; `python scripts/ci/source_audit_numeric.py` |
| D | Kernel checks of 533 numeric variants (325 amounts, 78 percentages, 131 decimals) by `decide`, plus boundary examples; independent spec; all 1,853 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a wrong multiplier scale, a percentage numerator misread, and a decimal treated as an integer. |
| U | Currency meaning, units, rounding and the provisions carrying these numbers NOT MODELLED. Human legal review pending. Status remains `PROVED_SCOPE`. |
