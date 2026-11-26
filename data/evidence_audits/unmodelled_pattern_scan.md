# Negative scan results — candidate families deliberately left unmodelled

Date: 2026-11-26. Read-only scans over clean `NOT_STARTED` units (no
unresolved conditions, no dependencies, no evidence). Not legal advice.

| Candidate pattern | Units | Decision and reason |
|---|---:|---|
| 年Xパーセント interest clauses (七・三 etc.) | 41 | Not modelled: the 365-day annualization convention is implicit in 「年」 and the period-in-days phrase. Encoding it would add an unstated premise. |
| ≥2 progressive bracket rows in full provision text | 1 | Already modelled (関税法 第12条の3). Exhaustive full-text scan completed, so no large missed bracket family. |
| 割増償却 (五割増/十割増) | 21 | Not a computation: the pinned unit says 「なお従前の例による」 and the 割増 phrase is a parenthetical cross-reference to old law. |
| 税率は百分 / 標準税率は tables | 5 | Table lookup without numeric cells in the unit; modelling would require inventing the table contents. |
| 合計所得金額がX万円以下 + fixed deduction | 3 | Too few and heterogeneous; each needs a different band table. |
| 収入金額/課税標準額 references | 212/816 | Referential or procedural text, not an arithmetic norm. |
| 課税標準額 + percentage in a single fragment | 0 | No instances. |

These units remain `NOT_STARTED` with their original unresolved-condition
status where applicable. They are NOT counted as verified or as progress.
This record exists so later work does not re-run the same scans and mistake
negative results for overlooked obligations.
