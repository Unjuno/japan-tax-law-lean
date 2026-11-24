# Normative units — 同様とする（準用の拡張）（112 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments ending 「…同様とする。」
extend a rule to an additional case ("the same applies when...").

| id | content |
|---|---|
| H | 規則の追加ケースへの拡張は論理和; 基本ケースにも追加ケースにも適用; ケースなしなら適用なし; 拡張は結合的; 空の追加(false)は規則を変えない; 既に含まれるケースでの拡張は冪等。 |
| T | `lake build JapanTaxLaw.SimilarlyApplyNormsTests`; `python scripts/ci/source_audit_similar.py` |
| D | カーネル証明: applies_to_base/extra / no_case_no_apply / extension_associative / empty_extension_noop / redundant_extension。112片 verbatim (3/3)。 |
| C | 対立解釈: 追加ケースに規則が適用されない読み、空の拡張で規則が変わる読み、拡張が非結合的な読みを却下。 |
| U | 具体の規則・ケースは NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
