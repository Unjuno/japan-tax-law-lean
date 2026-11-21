# Normative units — 表見出し・欄番号・用語・申請書項目（2,305 units, PROVED_SCOPE）

Recorded UNRESOLVED by the decomposer; only structural/ordinal claims are
proven, so all derive `PROVED_SCOPE`, never `FULLY_VERIFIED`.

| family | units | structure |
|---|---|---|
| table_header | 878 | 「Ａ　当該…額」 — Latin ordinal + label |
| bare_term | 1,055 | 総所得金額, 人口, 千円, 次に掲げる金額の合計額 etc. — bare term reference |
| form_field | 204 | 申請者の住所…, 代表者の氏名 — form field declaration |
| column_label | 168 | 第一欄..第十欄 — column ordinal |

| id | content |
|---|---|
| H | A table header pairs a Latin ordinal with a label; a column label gives an ordinal; a bare term resolves to a caller-supplied target; a form field is a structural declaration. |
| T | `lake build JapanTaxLaw.TableLabelsAndTermsTests`; `python scripts/ci/source_audit_tablelabels.py` |
| D | Kernel proofs of column ordinal parsing (第一欄, 第四欄), table-header ordinal, term reference identity and field declaration; independent spec; all 2,305 originals verbatim (4/4 checks). |
| C | Competing readings rejected: a wrong column/header ordinal, a bare term treated as a full norm, and a field declaration treated as a substantive condition. |
| U | The provisions carrying these labels/terms, their substantive conditions/effects and cross-references NOT MODELLED. Human legal review pending. Status remains `PROVED_SCOPE`. |
