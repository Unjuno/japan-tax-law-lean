# Normative units — 還付金の参照（…る還付金）（40 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments ending 「…る還付金。」reference
a refund amount arising under a provision.

| id | content |
|---|---|
| H | 過払額と同額の還付で残額は 0; 還付額は過払額以下; 複数還付は加算的合成; 0 との合成は無変化。 |
| T | `lake build JapanTaxLaw.RefundReferenceNormsTests`; `python scripts/ci/source_audit_refundref.py` |
| D | カーネル証明: full_refund_zero_remainder / refund_bounded / combine_is_sum / zero_refund_noop。40片 verbatim (3/3)。 |
| C | 対立解釈: 全額還付で残額が残る読み、還付額が過払額を超える読み、複数還付が加算されない読みを却下。 |
| U | 具体の金額・規定・過払額は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
