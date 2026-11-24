# Normative units — 免除（関税免除/延滞金免除）（37 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments ending 「…免除する。」are
exemptions extinguishing a liability (customs duty, late-payment charge).

| id | content |
|---|---|
| H | 全額免除は負債を 0 にする; 免除額は負債以下; 免除額 0 は無変化; 二回の免除は免除額の合計を差し引く(加算性)。 |
| T | `lake build JapanTaxLaw.ExemptionNormsTests`; `python scripts/ci/source_audit_exempt.py` |
| D | カーネル証明: full_exemption_extinguishes / exemption_bounded / zero_exemption_noop / exemption_additive。37片 verbatim (3/3)。 |
| C | 対立解釈: 二回免除が一回と同じ(冪等)という誤った主張は CHALLENGE で発見・訂正し加算性に修正; 免除額が負債を超える読みを却下。 |
| U | 具体の対象・金額・適用要件は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
