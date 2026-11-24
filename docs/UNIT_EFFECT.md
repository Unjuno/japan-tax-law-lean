# Normative units — 課税・科刑・徴収効果（課する/科する/収する）（189 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Three normative-effect operators:
「…課する。」(69, tax imposition), 「…科する。」(57, penalty imposition),
「…収する。」(63, tax collection).

| id | content |
|---|---|
| H | 課税は納税義務を生じさせ基準額の増加に単調; 科刑は違反時のみ発動; 複数義務は合成(加算)される; 徴収優先順位は推移的; 全额徴収で義務は消滅し部分徴収は残留額以下。 |
| T | `lake build JapanTaxLaw.ImpositionCollectionEffectsTests`; `python scripts/ci/source_audit_effect.py` |
| D | カーネル証明: impose_monotone_base / penalty_on_violation / obligations_compose / priority_transitive / full_collection_discharges / partial_collection_bounded。189片 verbatim (3/3)。 |
| C | 対立解釈: 違反なしで科刑が発動する読み、優先順位が非推移的な読み、部分徴収が義務を超える読みを却下。 |
| U | 具体の課税標準・金額・刑・優先当事者は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
