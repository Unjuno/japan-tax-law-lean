# Normative units — 残余事項の委任（…める事項）（53 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments ending 「…める事項。」are
residual delegations ("other matters prescribed by cabinet order / ministry ordinance").

| id | content |
|---|---|
| H | 残余集合は列挙集合の補集合; 列挙済み事項は残余に含まれない; 残余委任は全ての非列挙事項をカバー; 列挙を拡大すると残余は縮小(各部分残余の連言)。 |
| T | `lake build JapanTaxLaw.ResidualDelegationNormsTests`; `python scripts/ci/source_audit_resdel.py` |
| D | カーネル証明: residual_excludes_enumerated / delegation_covers_residual / larger_enum_smaller_residual。53片 verbatim (3/3)。 |
| C | 対立解釈: 列挙済み事項が残余に含まれる読み、列挙拡大で残余が拡大する読みを却下。 |
| U | 具体の事項・命令は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
