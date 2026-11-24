# Normative units — 金額の確定（…する金額）（48 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments ending 「…する金額。」reference
an amount to be collected/refunded/determined.

| id | content |
|---|---|
| H | 確定金額は決定関数の適用で決まり決定的; 同一キーなら同一金額; 複数金額は加算的; 0との加算は無変化; 還付額と徴収額は同じ値(符号は Nat)。 |
| T | `lake build JapanTaxLaw.AmountDeterminationNormsTests`; `python scripts/ci/source_audit_amtdet.py` |
| D | カーネル証明: determination_deterministic / same_key_same_amount / total_is_sum / zero_is_noop / refund_collect_same_value。48片 verbatim (3/3)。 |
| C | 対立解釈: 同一決定が異なる金額を与える読み、加算が交換則を破る読み、0加算が金額を変える読みを却下。 |
| U | 具体の金額・決定根拠は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
