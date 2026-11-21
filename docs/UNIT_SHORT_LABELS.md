# Normative units — 短いラベル・用語（1,112 units, PROVED_SCOPE）

| family | units | structure |
|---|---|---|
| short_term | 465 | 更正, 額, 年度, 様式, 当該, 又は, 三月, けん, し, あん … — structural term declaration |
| fullwidth_n | 463 | ｎ — full-width Latin n (ordinal 14, a=1) |
| kana_label | 184 | single hiragana あ..ん — gojūon ordinal |

Only ordinal/declaration structure is kernel-proven; substantive content is NOT
MODELLED. Unhandled conditions retained → `PROVED_SCOPE`, never `FULLY_VERIFIED`.

| id | content |
|---|---|
| H | These fragments are bare terms or phonetic/ordinal labels; their full content in these units is a declaration or ordinal. |
| T | `lake build JapanTaxLaw.ShortLabelsAndTermsTests`; `python scripts/ci/source_audit_shortlabels.py` |
| D | Kernel checks of the full-width n ordinal and representative hiragana ordinals plus term-declaration; independent spec; all 1,112 originals verbatim (4/4 checks). |
| C | Competing readings rejected: treating a bare term or phonetic label as a substantive norm, or mis-ordering the gojūon ordinal. |
| U | Substantive content NOT MODELLED. Human legal review pending. Status remains `PROVED_SCOPE`. |
