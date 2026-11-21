# Normative units — 非課税宣言・公債所在（1,823 units, FULLY_VERIFIED）

Whole norm = declaration → `FULLY_VERIFIED`. Concrete subjects/amounts caller-supplied
and NOT MODELLED.

| family | units | structure |
|---|---|---|
| tax_free_decl | 1,428 | 「…の非課税／免税」 — exemption declaration |
| bond_location | 393 | 「国債/地方債は施行地にある」 — location assignment |
| nontax_limit_calc | 2 | 非課税限度額の按分 — prorated limit |

| id | content |
|---|---|
| H | An exemption zeroes the tax; a bond's location is domestic or foreign; a prorated nontax limit is limit×(part/total). |
| T | `lake build JapanTaxLaw.TaxFreeAndBondNormsTests`; `python scripts/ci/source_audit_taxfree.py` |
| D | Kernel proofs of tax-free zeroing, proration zero/undefined, bond domestic/foreign and declaration; spec agreement; all 1,823 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a non-zero tax under exemption, a foreign bond treated as domestic, and a zero-denominator proration. |
| U | Concrete subjects/amounts caller-supplied/NOT MODELLED. Human legal review pending (separate axis). |
