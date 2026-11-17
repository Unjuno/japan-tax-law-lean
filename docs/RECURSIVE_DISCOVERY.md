# Recursive target-law discovery (machine-generated)

Do not hand-edit. Regenerate with `python scripts/law_audit/inventory/recursive_discovery.py`.

Objective §1 requires discovering target laws from reference, delegation and
application relations rather than a name keyword alone. This scanner extracts
law names that precede an article reference in every pinned raw snapshot and
reports names not present in the ledger's official_title set.

DISCOVERED-CANDIDATE entries are NOT added to INVENTORY automatically: adding a
law requires fetching its official revision and SHA-256 snapshot from e-Gov.
They are NOT counted as acquired, parsed, modelled or reviewed.

laws in ledger: 327
raw snapshots scanned: 325
distinct unmatched reference names: 7526
total unmatched reference occurrences: 47081

## Unmatched reference names (top 60 by frequency)

| count | name |
|---:|---|
| 3190 | 新租税特別措置法 |
| 3052 | 旧租税特別措置法 |
| 2592 | 施行令 |
| 724 | 旧法人税法 |
| 609 | 新法人税法 |
| 554 | 改正法 |
| 533 | 震災特例法 |
| 403 | 新所得税法 |
| 383 | 旧効力措置法 |
| 369 | 旧所得税法 |
| 319 | 金融商品取引法 |
| 318 | 特別措置法 |
| 271 | 外国居住者等所得相互免除法 |
| 250 | 四年新措置法 |
| 238 | 会社法 |
| 226 | 法律施行令 |
| 215 | 四年旧措置法 |
| 212 | 旧震災特例法 |
| 209 | 租税条約等実施特例法 |
| 207 | 第三条新令 |
| 187 | 旧地方税法 |
| 175 | 新租税特別措置法施行令 |
| 174 | 第四条新令 |
| 168 | 整備法 |
| 149 | 第五条新令 |
| 144 | 新震災特例法 |
| 140 | 新消費税法 |
| 138 | 第六条新令 |
| 138 | 福島復興再生特別措置法 |
| 137 | 都市計画法 |
| 135 | 保険業法 |
| 135 | 農地法 |
| 132 | 新関税法 |
| 128 | 地方自治法 |
| 123 | 第七条新令 |
| 121 | 法律施行規則 |
| 109 | 第八条新令 |
| 109 | 旧租税特別措置法施行令 |
| 109 | 新法人税法施行令 |
| 108 | 新相続税法 |
| 105 | 建築基準法 |
| 101 | 一施行令 |
| 100 | 第九条新令 |
| 99 | 租税条約等実施特例省令 |
| 93 | 道路運送車両法 |
| 91 | 四年新法 |
| 89 | 第二条法 |
| 87 | 新地方税法 |
| 85 | 第三条新規則 |
| 85 | 新租特法 |
| 84 | 沖縄振興特別措置法 |
| 83 | 第三条法 |
| 81 | 平成二十五年旧租特法 |
| 79 | 都市再開発法 |
| 79 | 改正令 |
| 77 | 旧農用地整備公団法 |
| 77 | 旧法人税法施行令 |
| 76 | 第十一条新令 |
| 75 | 第一条中所得税法 |
| 74 | 旧復興特区法 |
