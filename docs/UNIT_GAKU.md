# Normative units — 相当する額（金額の相当・同一視）（261 units, FULLY_VERIFIED）

Whole norm = equality/identity operator → `FULLY_VERIFIED`. Concrete base values
are caller-supplied and NOT MODELLED. This complements the equivalent-amount
batch that covered 「相当する金額」/「相当額」.

| family | units | structure |
|---|---|---|
| equivalent_gaku | 261 | 相当する額 — an amount identified with its corresponding base value |

| id | content |
|---|---|
| H | An amount 「相当する額」is identified with the caller-supplied base value to which it corresponds; the identification is reflexive, congruent and non-negative. |
| T | `lake build JapanTaxLaw.EquivalentGakuNormsTests`; `python scripts/ci/source_audit_gaku.py` |
| D | Kernel proofs of identity, congruence, non-negativity, zero and spec agreement (rfl); all 261 originals verbatim (3/3 checks). |
| C | Competing readings rejected: an equivalent amount differing from its base, and a non-congruent identification. |
| U | Concrete base values caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
