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

Additional scans (same date):
- 不均一課税 (161 units): almost all are formula-variable definitions
  (符号B/C etc.) inside the local-tax equalization formula, not standalone
  arithmetic norms. One unit states a clean 3-band 財政力指数 → multiplier
  (0.47/0.63/0.78 → 1, 2/3, 1/3) but it is a single norm unit and the
  companion table (別表第3の9A) is not in the unit.
- 財政力指数 (18 units): decimal coefficients with 3-decimal 四捨五入 and
  external stage tables; modelling would require importing those tables.

These units remain `NOT_STARTED` with their original unresolved-condition
status where applicable. They are NOT counted as verified or as progress.
This record exists so later work does not re-run the same scans and mistake
negative results for overlooked obligations.
