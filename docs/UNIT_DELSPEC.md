# Normative units — 委任事項の特定（政令で定めるXは、Yとする）（2128 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Pattern 「政令/省令で定めるXは、Yとする」
specifies what a cabinet-order-defined term denotes. Distinct from the 政令で定めるもの
delpub audit and the 定めるところにより delegated-manner audit.

| id | content |
|---|---|
| H | 委任項は特定対象に解決する; 解決は決定的; 同一委任項は同一対象; 特定は同値関係(反射・対称)。 |
| T | `lake build JapanTaxLaw.DelegatedSpecificationNormsTests`; `python scripts/ci/source_audit_delspec.py` |
| D | カーネル証明: spec_deterministic / same_term_same_target / spec_stable / spec_equiv_refl / spec_equiv_symm。2128片 verbatim (3/3)。 |
| C | 対立解釈: 同一委任項が異なる対象に解決する読み、特定が非対称な読みを却下。 |
| U | 具体の委任項・対象・政令は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
