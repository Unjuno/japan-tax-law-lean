# Normative units — 計算の基礎（…の計算の基礎となる）（40 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments containing 「…の計算の基礎となる」
identify a value serving as the base for computing a derived amount.

| id | content |
|---|---|
| H | 派生額は基準値に派生関数を適用した結果; 同一基準・同一関数なら同一派生額; 派生関数は合成可能; ゼロ基準に尺度関数を適用しても派生額 0。 |
| T | `lake build JapanTaxLaw.CalculationBasisNormsTests`; `python scripts/ci/source_audit_calcbasis.py` |
| D | カーネル証明: derivation_deterministic / same_base_same_result / compose_applies_in_sequence / zero_base_zero_derived。40片 verbatim (3/3)。 |
| C | 対立解釈: 同一基準・関数で異なる派生額が生じる読み、関数合成の順序を無視する読み、ゼロ基準で非ゼロ派生額が生じる読みを却下。 |
| U | 具体の基準・関数・派生額は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
