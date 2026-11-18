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

## Historical-version references (Phase F: amendment impact)

tax-name candidates prefixed '新' or '旧': 795 names / 12977 occurrences

These are references to historical/amended versions of laws already in the
ledger, found in 附則・経過措置. They are NOT new target laws. Verifying
amendment impact (Phase F) requires pinning those historical revisions to
e-Gov snapshots, which is NOT DONE. They are NOT counted as verified.

| count | name |
|---:|---|
| 3190 | 新租税特別措置法 |
| 3052 | 旧租税特別措置法 |
| 724 | 旧法人税法 |
| 609 | 新法人税法 |
| 403 | 新所得税法 |
| 369 | 旧所得税法 |
| 187 | 旧地方税法 |
| 175 | 新租税特別措置法施行令 |
| 140 | 新消費税法 |
| 132 | 新関税法 |
| 109 | 新法人税法施行令 |
| 109 | 旧租税特別措置法施行令 |
| 108 | 新相続税法 |
| 87 | 新地方税法 |
| 77 | 旧法人税法施行令 |
| 70 | 新酒税法 |
| 63 | 新国税通則法 |
| 62 | 元年旧地方税法 |
| 61 | 旧所得税法施行令 |
| 51 | 新所得税法施行令 |

## Tax-name candidates (contain '税', not in ledger) — 2873 names

These are the highest-priority DISCOVERED-CANDIDATE entries for sponsor review:
names containing '税' that precede an article reference but are not in INVENTORY.
They are NOT added automatically and NOT counted as verified or acquired.

| count | name |
|---:|---|
| 3190 | 新租税特別措置法 |
| 3052 | 旧租税特別措置法 |
| 724 | 旧法人税法 |
| 609 | 新法人税法 |
| 403 | 新所得税法 |
| 369 | 旧所得税法 |
| 209 | 租税条約等実施特例法 |
| 187 | 旧地方税法 |
| 175 | 新租税特別措置法施行令 |
| 140 | 新消費税法 |
| 132 | 新関税法 |
| 109 | 新法人税法施行令 |
| 109 | 旧租税特別措置法施行令 |
| 108 | 新相続税法 |
| 99 | 租税条約等実施特例省令 |
| 87 | 新地方税法 |
| 77 | 旧法人税法施行令 |
| 75 | 第一条中所得税法 |
| 70 | 新酒税法 |
| 63 | 新国税通則法 |
| 62 | 元年旧地方税法 |
| 61 | 旧所得税法施行令 |
| 61 | 石油税法 |
| 55 | 一所得税法 |
| 55 | 二所得税法 |
| 51 | 新所得税法施行令 |
| 51 | 物品税法 |
| 50 | 旧関税法 |
| 46 | 所得税法等改正法 |
| 45 | 旧消費税法 |
| 43 | 三所得税法 |
| 42 | 第二条中法人税法 |
| 41 | 一法人税法 |
| 40 | 砂糖消費税法 |
| 35 | 一第一条中地方税法 |
| 35 | 租税条約等実施特例政令 |
| 35 | 類税法 |
| 34 | 二法人税法 |
| 34 | 平成二十七年旧法人税法 |
| 33 | 旧酒税法 |
| 32 | 元年新地方税法 |
| 32 | 地方道路税法 |
| 32 | 新租税条約実施特例法 |
| 30 | 地方税法等改正法 |
| 30 | 旧相続税法 |
| 29 | 第四条中関税暫定措置法 |
| 28 | 所得税等負担軽減措置法 |
| 28 | 新租税特別措置法施行規則 |
| 27 | 新地方交付税法 |
| 26 | 四所得税法 |
| 26 | 税法施行令 |
| 25 | 十月旧法人税法 |
| 25 | 新租税条約等実施特例法 |
| 25 | 旧効力法人税法 |
| 24 | 三国税通則法 |
| 24 | 入場税法 |
| 24 | 十月新法人税法 |
| 24 | 平成二十二年旧租税特別措置法 |
| 24 | 沖縄租税特別措置法 |
| 24 | 第十条中租税特別措置法 |
| 23 | 令和八年新法人税法 |
| 23 | 取引所税法 |
| 23 | 第四条新所得税法 |
| 22 | 一租税特別措置法 |
| 22 | 旧効力消費税法 |
| 21 | 新所得税法施行規則 |
| 21 | 第三条新所得税法 |
| 20 | 三法人税法 |
| 20 | 五年消費税法 |
| 20 | 四年旧法人税法 |
| 20 | 平成二十六年新租税特別措置法 |
| 20 | 旧所得税法施行規則 |
| 20 | 旧租税特別措置法施行規則 |
| 20 | 表租税特別措置法施行令 |
| 19 | 二第一項租税特別措置法 |
| 19 | 新譲与税法 |
| 19 | 第五条新所得税法 |
| 19 | 第八条中租税特別措置法 |
| 19 | 第六条新所得税法 |
| 19 | 項租税特別措置法 |

## All unmatched reference names (top 60 by frequency)

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
