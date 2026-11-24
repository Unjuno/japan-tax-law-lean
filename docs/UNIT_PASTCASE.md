# Normative units — 過去事象の場合（「…た場合」）（245 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments ending 「…た場合」(including
「れた場合」/「けた場合」subsumed) are past-event conditions ("when X has been
submitted/received/occurred") gating a consequence.

| id | content |
|---|---|
| H | 過去事象条件は事象が発生したとき成立; 未発生否定条件は事象が発生しなかったとき成立; 発生と未発生は排他的; 複数事象はいずれか(OR)または全て(AND)で発動。 |
| T | `lake build JapanTaxLaw.PastEventCaseNormsTests`; `python scripts/ci/source_audit_pastcase.py` |
| D | カーネル証明: case_when_occurred / no_event_when_absent / occurred_exclusive / any_first / all_both。245片 verbatim (3/3)。 |
| C | 対立解釈: 発生なしで条件が成立する読み、発生と未発生が同時成立する読み、ORをANDとみなす読みを却下。 |
| U | 具体の事象・帰結は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
