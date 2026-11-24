# Normative units — 委任された方法（定めるところにより）（534 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments containing 「(政令/省令/...)で定める
ところにより」delegate the manner of applying a rule to an executive instrument.

| id | content |
|---|---|
| H | 委任事項は委任された方法関数を適用して解決される; 同一方法・同一入力なら解決は決定的; 同一方法の再適用は同じ結果; 方法は合成可能(二段階委任は m2(m1(input))); 恒等方法は入力を変えない。 |
| T | `lake build JapanTaxLaw.DelegatedMannerNormsTests`; `python scripts/ci/source_audit_deleg.py` |
| D | カーネル証明: delegation_deterministic / same_manner_same_result / delegation_stable / compose_applies_in_sequence / identity_manner_noop。534片 verbatim (3/3)。 |
| C | 対立解釈: 同一方法で異なる結果が生じる読み、方法合成の順序を無視する読み、恒等方法が入力を変える読みを却下。 |
| U | 具体の委任事項・方法・命令は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
