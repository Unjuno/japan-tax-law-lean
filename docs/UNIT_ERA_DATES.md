# Normative units — 元号日付の施行規定（6,486 units, PROVED_SCOPE）

6,486 fragments recorded UNRESOLVED by the decomposer:
- enforcement_date_clause (4,136): この法律は、<元号年月日>から施行する。
- date_literal (2,350): 昭和六十四年四月一日 etc.

Only the date structure (era, year, month, day) is kernel-proven with an
independent spec; calendar conversion and substantive provisions are NOT MODELLED.
Unhandled conditions retained → `PROVED_SCOPE`, never `FULLY_VERIFIED`.

| id | content |
|---|---|
| H | 「<元号>N年M月D日」は元号・年・月・日の構造を持つ日付ラベル。 |
| T | `lake build JapanTaxLaw.EraDateClausesTests`; `python scripts/ci/source_audit_eradate.py` |
| D | Kernel checks of 123 representative date variants covering all five eras, year/month/day boundaries (元=1, 十/百 compounds), plus effectiveDate identity; independent spec; all 6,486 originals verbatim (4/4 checks). |
| C | Competing readings rejected: misreading an era year or day, a date without a day component, and treating a date literal as a substantive norm. |
| U | Calendar conversion, actual dates and the substantive provisions NOT MODELLED. Human legal review pending. Status remains `PROVED_SCOPE`. |
