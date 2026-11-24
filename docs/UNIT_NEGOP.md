# Normative units — 否定操作（「…しない。」）（68 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Fragments ending 「…しない。」are
negative operations: an action explicitly NOT performed (算入しない 'not included',
要しない 'not required', 徴収しない 'not collected', 猶予しない 'not deferred').

| id | content |
|---|---|
| H | 否定操作は対応する肯定操作の補集合; 二重否定は肯定操作; 肯定操作と否定操作は排他的; 複数の否定操作は連言(すべて行わない); 否定操作が成立すれば対応する肯定操作は成立しない。 |
| T | `lake build JapanTaxLaw.NegativeOperationNormsTests`; `python scripts/ci/source_audit_negop.py` |
| D | カーネル証明: double_negation / pos_neg_exclusive / all_one_positive / negative_excludes_positive。68片 verbatim (3/3)。 |
| C | 対立解釈: 肯定操作と否定操作が同時に成立する読み、二重否定が否定のままである読み、否定操作が肯定操作を導く読みを却下。 |
| U | 具体の操作・対象は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
