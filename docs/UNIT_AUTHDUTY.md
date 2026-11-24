# Normative units — 条件的職権義務（…行うものとする）（155 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments ending 「…行うものとする。」
are conditional authority duties: "when conditions X are met, the authority shall
perform action Y".

| id | content |
|---|---|
| H | 義務はトリガー条件が成り立つとき生じる; トリガーなしなら義務なし; 義務が生じれば対応する行為が要求される; 複数義務は連言(すべて生じる); 義務と無義務は排他的。 |
| T | `lake build JapanTaxLaw.AuthorityDutyNormsTests`; `python scripts/ci/source_audit_AuthDuty.py` |
| D | カーネル証明: duty_when_triggered / no_duty_without_trigger / duty_yields_act / all_one_missing / duty_trigger_exclusive。155片 verbatim (3/3)。 |
| C | 対立解釈: トリガーなしで義務が生じる読み、義務が行為を要求しない読み、義務と無義務が同時成立する読みを却下。 |
| U | 具体の官庁・条件・行為は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
