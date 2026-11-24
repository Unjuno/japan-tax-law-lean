# Normative units — 事項の列挙（…する事項）（102 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments ending 「…する事項。」enumerate
matters to be recorded/reported.

| id | content |
|---|---|
| H | 空の列挙は完全; 全事項記載済みなら完全; 一事項でも未記載なら不完全; 二つの完全列挙の連結は完全; 未記載事項の追加は列挙を不完全にする。 |
| T | `lake build JapanTaxLaw.MattersEnumerationNormsTests`; `python scripts/ci/source_audit_matters.py` |
| D | カーネル証明: empty_complete / all_filled / one_missing / combine_complete / add_unfilled_incomplete。102片 verbatim (3/3)。 |
| C | 対立解釈: 未記載事項があっても完全とする読み、完全列挙の連結が不完全になる読み、未記載追加が完全を保つ読みを却下。 |
| U | 具体の事項識別・内容は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
