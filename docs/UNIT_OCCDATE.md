# Normative units — 発生日の参照（…があつた日）（51 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments ending 「…があつた日。」
reference the date on which an event occurred.

| id | content |
|---|---|
| H | 事象は高々一つの発生日を持つ(决定性); 同一事象は同一日; 二つの日は比較可能(全順序); 境界日は当日を含む。 |
| T | `lake build JapanTaxLaw.OccurrenceDateRefsTests`; `python scripts/ci/source_audit_occdate.py` |
| D | カーネル証明: occurrence_deterministic / same_event_same_date / order_refl / order_total / occurrence_on_boundary。51片 verbatim (3/3)。 |
| C | 対立解釈: 同一事象が複数の発生日を持つ読み、二日が比較不能な読み、境界日を当日に含まない読みを却下。 |
| U | 具体の事象・日付は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
