# Normative units — 相当する金額（金額の相当・同一視）（1251 units, FULLY_VERIFIED）

Whole norm = equality/identity operator → `FULLY_VERIFIED`. Concrete base values are
caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| equivalent_amount | 1251 | 相当する金額 — an amount identified with its corresponding base value |

| id | content |
|---|---|
| H | An amount 「相当する金額」is identified with the caller-supplied base value to which it corresponds; the identification is reflexive, congruent and transitive. |
| T | `lake build JapanTaxLaw.EquivalentAmountNormsTests`; `python scripts/ci/source_audit_equiv.py` |
| D | Kernel proofs of identity, reflexivity, congruence, transitivity, non-negativity and spec agreement (rfl); all 1251 originals verbatim (3/3 checks). |
| C | Competing readings rejected: an equivalent amount differing from its base, and a non-congruent identification. |
| U | Concrete base values caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
