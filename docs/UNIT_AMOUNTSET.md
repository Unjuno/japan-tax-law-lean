# Normative units — 額設定（「…額とする。」）（397 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments ending 「…額とする。」set
a tax amount by an arithmetic expression (base + addition, base − deduction, or a
computed amount).

| id | content |
|---|---|
| H | 加算額>0 なら設定額は基準額より大きい; 控除額は基準額を超えない; 全額控除なら 0; 加算して控除する合成は base+addition-deduction; 加算額>=控除額なら (base+addition)-deduction = base+(addition-deduction); 計算額設定は恒等。 |
| T | `lake build JapanTaxLaw.AmountSettingNormsTests`; `python scripts/ci/source_audit_amountset.py` |
| D | カーネル証明: addition_exceeds_base / deduction_not_exceeds_base / full_deduction_is_zero / add_sub_cancel_when_valid / computed identity。397片 verbatim (3/3)。 |
| C | 対立解釈: 控除額が基準額を超える読み、全額控除が 0 でない読み、加算・控除の順序を無視する読みを却下。 |
| U | 具体の基準額・税率・参照計算は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
