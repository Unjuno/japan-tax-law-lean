# Normative units — 記載事項の列挙（所在地/年月日/住所/氏名/その旨）（779 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Five field-enumeration suffixes:
「所在地」(256), 「年月日」(197), 「住所」(133), 「氏名」(118), 「その旨」(75).
Each enumerates fields that must be recorded in a prescribed form/register.

| id | content |
|---|---|
| H | 空のフォームは完全; 全項目記入済みなら完全; 一項目でも未記入なら不完全; 未記入項目が含まれるフォームは不完全; 二つの完全フォームの連結は完全; 記入済み项目の追加は完全性を保つ。 |
| T | `lake build JapanTaxLaw.FieldEnumerationNormsTests`; `python scripts/ci/source_audit_field.py` |
| D | カーネル証明: empty_is_complete / all_filled_complete / one_missing_incomplete / missing_implies_incomplete / combine_complete / add_duplicate_filled。779片 verbatim (3/3)。 |
| C | 対立解釈: 未記入項目があっても完全とする読み、完全フォームの連結が不完全になる読み、記入済み追加で不完全になる読みを却下。 |
| U | 具体の記載項目・フォーム内容は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
