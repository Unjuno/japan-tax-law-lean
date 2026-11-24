# Normative units — 期日・期間設定（日とする/月とする/日までとする/年とする）（144 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Date/period-setting suffixes: levy date
(118), duration (14), month count (8), deadline (4).

| id | content |
|---|---|
| H | 固定期日は与えた序数をそのまま返す; 期間は非負; 期限は day<=limit で包含的; limit+1 は期限超過; 期限を缓めても(limit+delta)以前の日は依然期限内; 満了日は開始日+期間で開始日以上; 期間0なら満了日=開始日。 |
| T | `lake build JapanTaxLaw.DateSettingNormsTests`; `python scripts/ci/source_audit_dateset.py` |
| D | カーネル証明: fixed_date_identity / deadline_inclusive / deadline_after / deadline_monotone / expiry_at_least_start / expiry_zero_duration。144片 verbatim (3/3)。 |
| C | 対立解釈: 期限日当日を超過とする読み、期限緩和で期限内でなくなる読み、満了日が開始日より前になる読みを却下。 |
| U | 具体の日付・期間・月份は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
