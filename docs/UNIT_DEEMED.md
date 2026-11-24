# Normative units — みなし（…とみなされる）（280 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments containing 「…とみなされる／
みなされた」are passive deemings: a subject is legally treated as something else.
Distinct from the existing active とみなす deeming audit.

| id | content |
|---|---|
| H | みなし関係は同値関係(反射・対称・推移); みなされた主体はみなし先の取扱いを継承する。 |
| T | `lake build JapanTaxLaw.DeemedStatusNormsTests`; `python scripts/ci/source_audit_deemed.py` |
| D | カーネル証明: deem_refl / deem_symm / deem_trans / deemed_inherits。280片 verbatim (3/3)。 |
| C | 対立解釈: みなしが反射的でない読み、非対称/非推移な読み、みなし先の取扱いを継承しない読みを却下。 |
| U | 具体の主体・対象・帰結は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
