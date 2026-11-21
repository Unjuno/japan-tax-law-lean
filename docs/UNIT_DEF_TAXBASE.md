# Normative units — 定義・課税標準（1,013 units, FULLY_VERIFIED）

Whole norm = definition/base declaration → `FULLY_VERIFIED`. Concrete terms
and bases are caller-supplied and NOT MODELLED.

| family | units | structure |
|---|---|---|
| definition | 568 | 「…とは…という」 — term definition |
| tax_base | 393 | 「課税標準は…とする」 — tax base declaration |
| rate_by_table | 52 | 「税率は、別表による」 — rate table reference |

| id | content |
|---|---|
| H | A definition maps a term to a meaning; a tax base is price or quantity; a rate is read from a caller-supplied table. |
| T | `lake build JapanTaxLaw.DefinitionAndTaxBaseNormsTests`; `python scripts/ci/source_audit_deftax.py` |
| D | Kernel proofs of definition lookup hit/miss, price-vs-quantity base selection and rate identity; spec agreement; all 1,013 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a wrong definition lookup, using quantity where price is specified, and a rate not from the table. |
| U | Concrete terms/bases/rates caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
