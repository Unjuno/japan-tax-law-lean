# Normative units — 同法参照（…する同法）（47 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments ending 「…する同法。」are
"same law" references (the antecedent statute, often under 準用 mutatis mutandis).

| id | content |
|---|---|
| H | 同法参照は先行法令 ID に解決する; 解決は決定的; 同一参照は同一法令; 反復参照は元の法令を指す(安定性); 準用の連鎖も解決として合成される。 |
| T | `lake build JapanTaxLaw.SameLawRefNormsTests`; `python scripts/ci/source_audit_samelaw.py` |
| D | カーネル証明: samelaw_deterministic / same_ref_same_law / samelaw_stable / chain_is_resolution。47片 verbatim (3/3)。 |
| C | 対立解釈: 同一参照が異なる法令に解決する読み、反復参照で法令が変わる読みを却下。 |
| U | 具体の法令識別・条文は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
