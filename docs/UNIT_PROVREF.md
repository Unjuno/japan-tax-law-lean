# Normative units — 規定参照（条の規定/項の規定/条項番号）（705 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Four provision-reference suffixes:
「…条の規定」(174), 「…項の規定」(160), 「…条第一項〜第四項」(317), 「…）の規定」(54).
Each references a target provision within/among laws.

| id | content |
|---|---|
| H | 参照は高々一つの規定に解決する(决定性); 同一参照は同一規定に解決; 等しい参照キーは等しい解決先; 改正合成は解決後に改正写像を適用; 恒等改正は解決を変えない。 |
| T | `lake build JapanTaxLaw.ProvisionReferenceNormsTests`; `python scripts/ci/source_audit_provref.py` |
| D | カーネル証明: resolve_deterministic / same_ref_same_target / equal_keys_equal_targets / amendment_composes / identity_amendment_preserves。705片 verbatim (3/3)。 |
| C | 対立解釈: 同一参照が複数規定に解決する読み、等しいキーが異なる解決先を持つ読み、恒等改正が解決を変える読みを却下。 |
| U | 具体の法律・条・項の識別は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
