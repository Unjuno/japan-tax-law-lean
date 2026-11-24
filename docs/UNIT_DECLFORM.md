# Normative units — 申告書の参照（…る申告書）（37 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments ending 「…る申告書。」reference
a declaration form prescribed by a provision.

| id | content |
|---|---|
| H | 書式参照は規定キーから書式への解決関数で決まる; 解決は決定的; 同一キーは同一書式(安定性); 異なるキーは異なる書式を持ちうる。 |
| T | `lake build JapanTaxLaw.DeclarationFormRefsTests`; `python scripts/ci/source_audit_declform.py` |
| D | カーネル証明: form_deterministic / same_key_same_form / form_stable / distinct_keys_bool。37片 verbatim (3/3)。 |
| C | 対立解釈: 同一キーが異なる書式に解決する読み、解決が不安定な読みを却下。 |
| U | 具体の書式・規定・記載内容は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
