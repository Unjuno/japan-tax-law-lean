# Normative units — 税名・税率・算定用語・見出し（6,275 units, PROVED_SCOPE）

| family | units | structure |
|---|---|---|
| rate_entry | 4,140 | イ　令和５年度市場公募都市に係るもの　０．００８０八 — year + rate |
| enforcement_ref | 1,122 | 酒税法の一部を改正する法律（…）の施行の日 — act reference |
| application_heading | 642 | （軽減税率適用貨物の用途外使用の制限等） — section heading |
| computation_term | 169 | 次に掲げる税額のうちいずれか少ない税額 — min-selector |
| tax_name | 168 | 道府県民税, 固定資産税 … — tax-kind label |
| fraction | 34 | 四分の一 etc. — rational fraction |

Only structural/ordinal claims are kernel-proven; actual rates and substantive
content are NOT MODELLED. Unhandled conditions retained → `PROVED_SCOPE`.

| id | content |
|---|---|
| H | These fragments are rate entries, act references, headings, computation terms, tax names or fractions; their full content in these units is structural. |
| T | `lake build JapanTaxLaw.BareTermsAndRatesTests`; `python scripts/ci/source_audit_bareterms.py` |
| D | Kernel proofs of rate application, act-reference identity, min-selector bounds and declaration records; independent spec; all 6,275 originals verbatim (4/4 checks). |
| C | Competing readings rejected: treating a rate entry or heading as a substantive norm, or mis-selecting the minimum. |
| U | Actual rates, substantive tax content and cross-references NOT MODELLED. Human legal review pending. Status remains `PROVED_SCOPE`. |
