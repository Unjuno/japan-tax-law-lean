# Normative units — 地方税法 第七十二条の十三（法人の事業年度の確定）（7 units, PROVED_SCOPE）

Genuine per-provision formalization. Pinned original:
`data/raw/325AC0000000226_20261101_508AC0000000002.law.json` Article 72_13.

## 原文の規範構造
1. 定款等に事業年度の定めがない法人 → 法人税法13(2)/(3)の届出/指定期間。
2. 届出をしなかった人格のない社団等 → 1月1日〜12月31日（収益事業開始日は特例）。
3. 通算子法人 → 通算親法人の開始/終了日に整合。
4. 所定事実発生 → 当日の前日に終了、当日から開始（合併解散等は開始例外）。
5-6. 事実定義（完全支配関係の取得／申請特例年度開始時の完全支配関係）。
7. 承認不在等 → 申請特例年度終了日から開始（合併解散等は特例）。

Model: Day=Nat (1..365), FiscalYear=(start,end). Kernel-proven: boundary contiguity
(start=d = end+1 when end=d-1, d>=2), in-year nonemptiness, default calendar year
(1,365), merger-exception suppression, consolidated alignment.

| id | content |
|---|---|
| H | 境界日 d で事業年度を分割すると旧年度は d-1 に終了し新年度は d から開始し連続する; d>=2 で d-1>=1; 既定年は (1,365); 合併解散等フラグで開始日を特例終了日に切替; 通算子法人は親法人の開始/終了日に整合。 |
| T | `lake build JapanTaxLaw.CorpFiscalYearArt72_13Tests`; `python scripts/ci/source_audit_corp7213.py` |
| D | カーネル証明: boundary_contiguous / boundary_in_year / end_before_next_start / 例外切替 / 通算整合。7片 verbatim (3/3)。 |
| C | 対立解釈: 境界日をまたぐ空白/重複を許す読み、既定年を (0,366) とする読み、合併例外を無視する読みを却下。 |
| U | 具体的法人識別・届出/承認事実・他法令参照は NOT MODELLED; 人間レビュー保留(別軸) → PROVED_SCOPE。 |
