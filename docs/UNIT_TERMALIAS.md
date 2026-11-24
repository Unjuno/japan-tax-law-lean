# Normative units — 用語の定義（以下「…」という）（2207 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments containing 「以下…「X」という」
introduce a term alias: a long expression is henceforth referred to by a short name
within a scope. Distinct from the をいう active-definition audit.

| id | content |
|---|---|
| H | 別名は定義と同じ対象を指す; 別名関係は同値関係(反射・対称・推移); 別名導入は決定的(同じ定義には同じ別名)。 |
| T | `lake build JapanTaxLaw.TermAliasNormsTests`; `python scripts/ci/source_audit_termalias.py` |
| D | カーネル証明: alias_refl / alias_symm / alias_trans / alias_intro_deterministic / same_defn_same_alias。2207片 verbatim (3/3)。 |
| C | 対立解釈: 別名が定義と異なる対象を指す読み、別名関係が非対称/非推移な読み、同一定義に異なる別名が付く読みを却下。 |
| U | 具体の表現・別名・適用範囲は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
