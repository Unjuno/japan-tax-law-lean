# Normative units — 税率設定（税率は…とする）（41 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments setting tax rates: fractional
rates (七十八分の二十二 = 22/78) and per-unit amounts (千本につき千七十円).

| id | content |
|---|---|
| H | 分数税率による税額は base×num/den; 分母>0 のとき税率=den/den なら税額=base; 単位当たり税額は数量×単位額; 数量0なら税額0; 数量増加に単調; 税額は非負。 |
| T | `lake build JapanTaxLaw.RateSettingNormsTests`; `python scripts/ci/source_audit_rateset.py` |
| D | カーネル証明: zero_base_zero_tax / rate_one_is_identity / per_unit_zero_quantity / per_unit_monotone / nonnegativity。41片 verbatim (3/3)。 |
| C | 対立解釈: 基準額0で非ゼロ税額、税率=1で税額≠base、数量増加で税額減少、を却下。 |
| U | 具体の税率・単位・金額は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |

Note: unique filenames (source_audit_rateset.py / source_correspondence_rateset.json)
used to avoid clobbering the existing 926-unit source_audit_rate.py batch.
