# Normative units — 算定額の参照（した金額/定した額/める金額）（297 units, PROVED_SCOPE）

Per-provision formalization across tax laws. Three computed-amount reference suffixes:
「…した金額」(168), 「…定した額」(71), 「…める金額」(58). Each references an amount
derived by a computation or prescription rather than a literal figure.

| id | content |
|---|---|
| H | 算定額は基準額に算定方法を適用した結果で決定的(同じ入力なら同じ出力); 規定額はそのまま参照; 算定方法は合成可能(二段階算定は m2(m1(base)); 算定額は非負。 |
| T | `lake build JapanTaxLaw.ComputedAmountRefsTests`; `python scripts/ci/source_audit_compamount.py` |
| D | カーネル証明: computed_is_deterministic / computed_same_inputs_same_output / prescribed_is_identity / compose_applies_in_sequence / computed_nonnegative。297片 verbatim (3/3)。 |
| C | 対立解釈: 同じ入力・方法で異なる算定額が生じる読み、規定額が元の値と異なる読み、算定方法の合成順序を無視する読みを却下。 |
| U | 具体の基準額・算定式・数値は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
