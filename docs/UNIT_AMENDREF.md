# Normative units — 改正規定の列挙（…改正規定）（132 units, PROVED_SCOPE）

Per-provision formalization across amending statutes. Fragments ending 「…改正規定」
enumerate amendment operations on provisions (add/delete/modify: 「…を削る」,
「…に二項を加える」, 「…の改正規定」). Distinct from the existing amendment-enforcement
(改正規定 + 施行) audit — these have no 施行 marker.

| id | content |
|---|---|
| H | 改正リストは追加/削除/改正の操作数の有限リスト; 二つのリストの合成は各操作数の加算; 空リストは単位元; 追加数=削除数ならネット効果 0; 異なる規定への操作は独立(合成は可換)。 |
| T | `lake build JapanTaxLaw.AmendmentProvisionRefsTests`; `python scripts/ci/source_audit_amendref.py` |
| D | カーネル証明: combine_is_additive / empty_is_identity / balanced_amend_net_zero / combine_commutative。132片 verbatim (3/3)。 |
| C | 対立解釈: 空リストが単位元でない読み、追加=削除でもネット効果が非ゼロの読み、合成が非可換の読みを却下。 |
| U | 具体の規定識別・改正内容は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
