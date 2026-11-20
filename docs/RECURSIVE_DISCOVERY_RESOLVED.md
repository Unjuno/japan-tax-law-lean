# Recursive discovery — resolution to official law IDs (machine-generated)

Do not hand-edit. Regenerate with `python scripts/law_audit/inventory/recursive_discovery_resolve.py`.

Objective §2: reference / delegation / amendment relations are explored
recursively, including related laws whose names do NOT contain 「税」.
Names are resolved against the FULL e-Gov national law list, not only
against the 327-law '税' keyword ledger.

All entries are DISCOVERED-CANDIDATES. They are NOT added to INVENTORY,
NOT acquired, NOT parsed, NOT modelled, NOT proved and NOT reviewed.
Historical / unenforced revisions remain a separate layer.

- snapshot date: 2026-11-15
- full law-list entries: 9001
- ledger laws: 327
- unmatched reference names scanned: 7524
- resolved to NEW official law ids: 382
- resolved as aliases of laws already in ledger: 2
- historical-version references (base law resolved, revision NOT pinned): 93 names / 10373 occurrences
- unresolved names: 7045

「新／旧＋法令名」は附則・経過措置における既知法令の歴史的施行版への参照であり、
別の未取得法令ではない。ベース法令IDは解決済みだが、対応する施行版のスナップショットは
固定されていない（`historical_revision_pinned=false`）。未取得・取得不能とも区別する。

## Historical-version references (base resolved, revision not pinned)

| name | occurrences | base law_id | base name | revision pinned |
|---|---:|---|---|:--:|
| 新租税特別措置法 | 3190 | `332AC0000000026` | 租税特別措置法 | NO |
| 旧租税特別措置法 | 3052 | `332AC0000000026` | 租税特別措置法 | NO |
| 旧法人税法 | 724 | `340AC0000000034` | 法人税法 | NO |
| 新法人税法 | 609 | `340AC0000000034` | 法人税法 | NO |
| 新所得税法 | 403 | `340AC0000000033` | 所得税法 | NO |
| 旧所得税法 | 369 | `340AC0000000033` | 所得税法 | NO |
| 旧地方税法 | 187 | `325AC0000000226` | 地方税法 | NO |
| 新租税特別措置法施行令 | 175 | `332CO0000000043` | 租税特別措置法施行令 | NO |
| 新消費税法 | 140 | `363AC0000000108` | 消費税法 | NO |
| 新関税法 | 132 | `329AC0000000061` | 関税法 | NO |
| 新法人税法施行令 | 109 | `340CO0000000097` | 法人税法施行令 | NO |
| 旧租税特別措置法施行令 | 109 | `332CO0000000043` | 租税特別措置法施行令 | NO |
| 新相続税法 | 108 | `325AC0000000073` | 相続税法 | NO |
| 新地方税法 | 87 | `325AC0000000226` | 地方税法 | NO |
| 旧法人税法施行令 | 77 | `340CO0000000097` | 法人税法施行令 | NO |
| 新酒税法 | 70 | `328AC0000000006` | 酒税法 | NO |
| 新国税通則法 | 63 | `337AC0000000066` | 国税通則法 | NO |
| 旧所得税法施行令 | 61 | `340CO0000000096` | 所得税法施行令 | NO |
| 新所得税法施行令 | 51 | `340CO0000000096` | 所得税法施行令 | NO |
| 旧関税法 | 50 | `329AC0000000061` | 関税法 | NO |
| 旧消費税法 | 45 | `363AC0000000108` | 消費税法 | NO |
| 旧厚生年金保険法 | 43 | `329AC0000000115` | 厚生年金保険法 | NO |
| 新沖縄振興特別措置法 | 38 | `414AC0000000014` | 沖縄振興特別措置法 | NO |
| 旧酒税法 | 33 | `328AC0000000006` | 酒税法 | NO |
| 旧相続税法 | 30 | `325AC0000000073` | 相続税法 | NO |
| 新租税特別措置法施行規則 | 28 | `332M50000040015` | 租税特別措置法施行規則 | NO |
| 新地方交付税法 | 27 | `325AC0000000211` | 地方交付税法 | NO |
| 新所得税法施行規則 | 21 | `340M50000040011` | 所得税法施行規則 | NO |
| 旧所得税法施行規則 | 20 | `340M50000040011` | 所得税法施行規則 | NO |
| 旧租税特別措置法施行規則 | 20 | `332M50000040015` | 租税特別措置法施行規則 | NO |
| 旧農地法 | 20 | `327AC0000000229` | 農地法 | NO |
| 新地方法人税法 | 17 | `426AC0000000011` | 地方法人税法 | NO |
| 旧地方法人税法 | 17 | `426AC0000000011` | 地方法人税法 | NO |
| 新国税徴収法 | 15 | `334AC0000000147` | 国税徴収法 | NO |
| 新法人税法施行規則 | 15 | `340M50000040012` | 法人税法施行規則 | NO |
| 新税理士法 | 12 | `326AC1000000237` | 税理士法 | NO |
| 旧民法 | 11 | `129AC0000000089` | 民法 | NO |
| 旧確定給付企業年金法 | 10 | `413AC0000000050` | 確定給付企業年金法 | NO |
| 新特定非営利活動促進法 | 9 | `410AC1000000007` | 特定非営利活動促進法 | NO |
| 新登録免許税法 | 9 | `342AC0000000035` | 登録免許税法 | NO |
| 旧国税通則法 | 9 | `337AC0000000066` | 国税通則法 | NO |
| 旧国税徴収法 | 8 | `334AC0000000147` | 国税徴収法 | NO |
| 新地価税法 | 7 | `403AC0000000069` | 地価税法 | NO |
| 新地方税法施行規則 | 7 | `329M50000002023` | 地方税法施行規則 | NO |
| 新地方税法施行令 | 6 | `325CO0000000245` | 地方税法施行令 | NO |
| 旧住民基本台帳法 | 6 | `342AC0000000081` | 住民基本台帳法 | NO |
| 旧地方税法施行令 | 6 | `325CO0000000245` | 地方税法施行令 | NO |
| 新地方自治法 | 5 | `322AC0000000067` | 地方自治法 | NO |
| 新自動車重量譲与税法 | 5 | `346AC0000000090` | 自動車重量譲与税法 | NO |
| 新鉱山保安法 | 5 | `324AC0000000070` | 鉱山保安法 | NO |
| 旧勤労者財産形成促進法 | 5 | `346AC0000000092` | 勤労者財産形成促進法 | NO |
| 旧商法 | 5 | `132AC0000000048` | 商法 | NO |
| 旧沖縄振興特別措置法 | 5 | `414AC0000000014` | 沖縄振興特別措置法 | NO |
| 旧法人税法施行規則 | 5 | `340M50000040012` | 法人税法施行規則 | NO |
| 旧鉱山保安法 | 5 | `324AC0000000070` | 鉱山保安法 | NO |
| 新公認会計士法 | 4 | `323AC0000000103` | 公認会計士法 | NO |
| 新海上運送法 | 4 | `324AC0000000187` | 海上運送法 | NO |
| 新航空機燃料譲与税法 | 4 | `347AC0000000013` | 航空機燃料譲与税法 | NO |
| 旧森林法 | 4 | `326AC1000000249` | 森林法 | NO |
| 旧石油石炭税法 | 4 | `353AC0000000025` | 石油石炭税法 | NO |
| 新航空機燃料譲与税法施行規則 | 3 | `347M50000008026` | 航空機燃料譲与税法施行規則 | NO |
| 新農地法 | 3 | `327AC0000000229` | 農地法 | NO |
| 新関税法施行令 | 3 | `329CO0000000150` | 関税法施行令 | NO |
| 旧地方揮発油税法 | 3 | `330AC0000000104` | 地方揮発油税法 | NO |
| 旧揮発油税法 | 3 | `332AC0000000055` | 揮発油税法 | NO |
| 旧産業競争力強化法 | 3 | `425AC0000000098` | 産業競争力強化法 | NO |
| 旧税理士法 | 3 | `326AC1000000237` | 税理士法 | NO |
| 旧酒税法施行令 | 3 | `337CO0000000097` | 酒税法施行令 | NO |
| 改正後地方税法 | 2 | `325AC0000000226` | 地方税法 | NO |
| 改正後確定拠出年金法 | 2 | `413AC0000000088` | 確定拠出年金法 | NO |
| 新消費税法施行令 | 2 | `363CO0000000360` | 消費税法施行令 | NO |
| 旧中小企業総合事業団法 | 2 | `416CO0000000181` | 中小企業総合事業団法 | NO |
| 旧印紙税法 | 2 | `342AC0000000023` | 印紙税法 | NO |
| 旧消費税法施行規則 | 2 | `363M50000040053` | 消費税法施行規則 | NO |
| 旧都市計画法 | 2 | `343AC0000000100` | 都市計画法 | NO |
| 旧電気事業法 | 2 | `339AC0000000170` | 電気事業法 | NO |
| 旧電源開発促進税法 | 2 | `349AC0000000079` | 電源開発促進税法 | NO |
| 改正前地方税法 | 1 | `325AC0000000226` | 地方税法 | NO |
| 改正前確定給付企業年金法 | 1 | `413AC0000000050` | 確定給付企業年金法 | NO |
| 新司法書士法 | 1 | `325AC1000000197` | 司法書士法 | NO |

## New law-id candidates (not in ledger)

| law_id | name | occurrences | contains 税 | method |
|---|---|---:|:--:|---|
| `323AC0000000025` | 金融商品取引法 | 319 | NO | exact_law_name |
| `417AC0000000086` | 会社法 | 238 | NO | exact_law_name |
| `424AC0000000025` | 福島復興再生特別措置法 | 138 | NO | exact_law_name |
| `343AC0000000100` | 都市計画法 | 137 | NO | exact_law_name |
| `327AC0000000229` | 農地法 | 135 | NO | exact_law_name |
| `407AC0000000105` | 保険業法 | 135 | NO | exact_law_name |
| `322AC0000000067` | 地方自治法 | 128 | NO | exact_law_name |
| `325AC0000000201` | 建築基準法 | 105 | NO | exact_law_name |
| `326AC0000000185` | 道路運送車両法 | 93 | NO | exact_law_name |
| `414AC0000000014` | 沖縄振興特別措置法 | 84 | NO | exact_law_name |
| `344AC0000000038` | 都市再開発法 | 79 | NO | exact_law_name |
| `322AC0000000164` | 児童福祉法 | 72 | NO | exact_law_name |
| `323AC0000000109` | 地方財政法 | 62 | NO | exact_law_name |
| `355AC0000000065` | 農業経営基盤強化促進法 | 62 | NO | exact_law_name |
| `423AC0000000122` | 東日本大震災復興特別区域法 | 62 | NO | exact_law_name |
| `323AC0000000205` | 医療法 | 58 | NO | exact_law_name |
| `324AC0000000195` | 土地改良法 | 57 | NO | exact_law_name |
| `326AC1000000249` | 森林法 | 56 | NO | exact_law_name |
| `425AC0000000098` | 産業競争力強化法 | 54 | NO | exact_law_name |
| `329AC0000000119` | 土地区画整理法 | 53 | NO | exact_law_name |
| `346AC0000000092` | 勤労者財産形成促進法 | 53 | NO | exact_law_name |
| `339AC0000000170` | 電気事業法 | 50 | NO | exact_law_name |
| `407AC0000000014` | 被災市街地復興特別措置法 | 46 | NO | exact_law_name |
| `326AC0000000045` | 社会福祉法 | 45 | NO | exact_law_name |
| `414AC0000000022` | 都市再生特別措置法 | 45 | NO | exact_law_name |
| `338AC0000000125` | 商業登記法 | 43 | NO | exact_law_name |
| `417AC0000000024` | 地域再生法 | 42 | NO | exact_law_name |
| `322AC0000000132` | 農業協同組合法 | 39 | NO | exact_law_name |
| `322AC0000000026` | 学校教育法 | 37 | NO | exact_law_name |
| `325AC0100000214` | 文化財保護法 | 37 | NO | exact_law_name |
| `409AC0000000123` | 介護保険法 | 37 | NO | exact_law_name |
| `361AC0000000092` | 鉄道事業法 | 34 | NO | exact_law_name |
| `324AC0000000187` | 海上運送法 | 33 | NO | exact_law_name |
| `327AC1000000180` | 道路法 | 33 | NO | exact_law_name |
| `415AC0000000118` | 地方独立行政法人法 | 33 | NO | exact_law_name |
| `413AC0000000050` | 確定給付企業年金法 | 32 | NO | exact_law_name |
| `418AC0000000108` | 信託法 | 32 | NO | exact_law_name |
| `329AC1000000189` | 奄美群島振興開発特別措置法 | 31 | NO | exact_law_name |
| `308AC0000000011` | 船舶安全法 | 29 | NO | exact_law_name |
| `325AC0000000218` | 港湾法 | 29 | NO | exact_law_name |
| `327AC0000000231` | 航空法 | 28 | NO | exact_law_name |
| `356AC0000000059` | 銀行法 | 27 | NO | exact_law_name |
| `405AC0000000047` | 不正競争防止法 | 27 | NO | exact_law_name |
| `327AC1000000176` | 宅地建物取引業法 | 26 | NO | exact_law_name |
| `328AC1000000072` | 離島振興法 | 26 | NO | exact_law_name |
| `360AC1000000063` | 半島振興法 | 25 | NO | exact_law_name |
| `325AC0000000264` | 中小企業信用保険法 | 24 | NO | exact_law_name |
| `416AC0000000075` | 破産法 | 24 | NO | exact_law_name |
| `324AC0000000270` | 私立学校法 | 23 | NO | exact_law_name |
| `324AC0000000185` | 産業標準化法 | 22 | NO | exact_law_name |
| `326M50010000054` | 森林法施行規則 | 21 | NO | exact_law_name |
| `333AC0000000192` | 国民健康保険法 | 21 | NO | exact_law_name |
| `338AC0000000129` | 近畿圏整備法 | 21 | NO | exact_law_name |
| `411AC0000000018` | 中小企業等経営強化法 | 21 | NO | exact_law_name |
| `425AC0000000107` | 国家戦略特別区域法 | 21 | NO | exact_law_name |
| `413AC0000000088` | 確定拠出年金法 | 20 | NO | exact_law_name |
| `405AC0000000088` | 行政手続法 | 19 | NO | exact_law_name |
| `326AC0000000183` | 道路運送法 | 18 | NO | exact_law_name |
| `326AC0100000219` | 土地収用法 | 18 | NO | exact_law_name |
| `331AC0000000083` | 首都圏整備法 | 18 | NO | exact_law_name |
| `411M50000400074` | 中小企業等経営強化法施行規則 | 18 | NO | exact_law_name |
| `417AC0000000097` | 郵政民営化法 | 18 | NO | exact_law_name |
| `324AC0000000181` | 中小企業等協同組合法 | 17 | NO | exact_law_name |
| `325AC0000000144` | 生活保護法 | 17 | NO | exact_law_name |
| `325AC0000000239` | 商品先物取引法 | 17 | NO | exact_law_name |
| `338AC0000000133` | 老人福祉法 | 17 | NO | exact_law_name |
| `349AC1000000092` | 国土利用計画法 | 17 | NO | exact_law_name |
| `355AC0000000086` | 農住組合法 | 17 | NO | exact_law_name |
| `210AC0000000076` | 軌道法 | 16 | NO | exact_law_name |
| `325AC1000000100` | 公職選挙法 | 16 | NO | exact_law_name |
| `341AC1000000102` | 中部圏開発整備法 | 16 | NO | exact_law_name |
| `414AC0000000147` | 独立行政法人中小企業基盤整備機構法 | 16 | NO | exact_law_name |
| `329AC0000000115` | 厚生年金保険法 | 15 | NO | exact_law_name |
| `336AC0000000223` | 災害対策基本法 | 15 | NO | exact_law_name |
| `342AC0000000122` | 通関業法 | 15 | NO | exact_law_name |
| `344AC0000000079` | 小笠原諸島振興開発特別措置法 | 15 | NO | exact_law_name |
| `349AC0000000116` | 雇用保険法 | 15 | NO | exact_law_name |
| `414CO0000000102` | 沖縄振興特別措置法施行令 | 15 | NO | exact_law_name |
| `416AC0000000123` | 不動産登記法 | 15 | NO | exact_law_name |
| `322CO0000000016` | 地方自治法施行令 | 14 | NO | exact_law_name |
| `324AC0000000100` | 建設業法 | 14 | NO | exact_law_name |
| `325AC0000000261` | 地方公務員法 | 14 | NO | exact_law_name |
| `346AC0000000034` | 預金保険法 | 14 | NO | exact_law_name |
| `348AC0000000072` | 都市緑地法 | 14 | NO | exact_law_name |
| `410AC1000000007` | 特定非営利活動促進法 | 14 | NO | exact_law_name |
| `424M60000004003` | 福島復興再生特別措置法施行規則 | 14 | NO | exact_law_name |
| `334AC0000000160` | 中小企業退職金共済法 | 13 | NO | exact_law_name |
| `348AC0000000101` | 中小小売商業振興法 | 13 | NO | exact_law_name |
| `401AC0000000082` | 貨物利用運送事業法 | 13 | NO | exact_law_name |
| `411AC0000000089` | 内閣府設置法 | 13 | NO | exact_law_name |
| `326AC0000000191` | 国家公務員災害補償法 | 12 | NO | exact_law_name |
| `322AC0000000049` | 労働基準法 | 11 | NO | exact_law_name |
| `325AC0000000289` | 鉱業法 | 11 | NO | exact_law_name |
| `326AC1000000238` | 信用金庫法 | 11 | NO | exact_law_name |
| `327AC0000000219` | 国有財産特別措置法 | 11 | NO | exact_law_name |
| `336AC0000000081` | 技術研究組合法 | 11 | NO | exact_law_name |
| `336AC0000000159` | 割賦販売法 | 11 | NO | exact_law_name |
| `322AC0000000100` | 船員法 | 10 | NO | exact_law_name |
| `323AC1000000186` | 消防法 | 10 | NO | exact_law_name |
| `342AC0000000081` | 住民基本台帳法 | 10 | NO | exact_law_name |
| `348AC0000000053` | 農水産業協同組合貯金保険法 | 10 | NO | exact_law_name |
| `349AC0000000068` | 生産緑地法 | 10 | NO | exact_law_name |
| `413AC0000000093` | 農林中央金庫法 | 10 | NO | exact_law_name |
| `418M60000010013` | 会社計算規則 | 10 | NO | exact_law_name |
| `426M60000400001` | 経済産業省関係産業競争力強化法施行規則 | 10 | NO | exact_law_name |
| `323AC0000000242` | 水産業協同組合法 | 9 | NO | exact_law_name |
| `325AC0000000131` | 電波法 | 9 | NO | exact_law_name |
| `327AC0100000239` | 旅行業法 | 9 | NO | exact_law_name |
| `332AC0000000106` | 駐車場法 | 9 | NO | exact_law_name |
| `338AC0000000056` | 森林組合合併助成法 | 9 | NO | exact_law_name |
| `340AC0000000102` | 小規模企業共済法 | 9 | NO | exact_law_name |
| `423AC0000000081` | 総合特別区域法 | 9 | NO | exact_law_name |
| `426AC0000000068` | 行政不服審査法 | 9 | NO | exact_law_name |
| `430M60001FCA001` | 産業競争力強化法施行規則 | 9 | NO | exact_law_name |
| `325CO0000000338` | 建築基準法施行令 | 8 | NO | exact_law_name |
| `326AC1000000285` | 博物館法 | 8 | NO | exact_law_name |
| `332AC0000000177` | 水道法 | 8 | NO | exact_law_name |
| `334AC0000000141` | 国民年金法 | 8 | NO | exact_law_name |
| `337CO0000000352` | 地方公務員等共済組合法施行令 | 8 | NO | exact_law_name |
| `339AC0000000167` | 河川法 | 8 | NO | exact_law_name |
| `359AC0000000086` | 電気通信事業法 | 8 | NO | exact_law_name |
| `406AC0000000077` | 不動産特定共同事業法 | 8 | NO | exact_law_name |
| `411AC0000000225` | 民事再生法 | 8 | NO | exact_law_name |
| `411M50000100036` | 介護保険法施行規則 | 8 | NO | exact_law_name |
| `415AC0000000120` | 次世代育成支援対策推進法 | 8 | NO | exact_law_name |
| `426M60000002020` | 国家戦略特別区域法施行規則 | 8 | NO | exact_law_name |
| `211AC0000000070` | 健康保険法 | 7 | NO | exact_law_name |
| `323AC0000000073` | 国有財産法 | 7 | NO | exact_law_name |
| `323AC0000000138` | 旅館業法 | 7 | NO | exact_law_name |
| `327AC0000000292` | 地方公営企業法 | 7 | NO | exact_law_name |
| `335AC0000000084` | 住宅地区改良法 | 7 | NO | exact_law_name |
| `337AC0000000139` | 行政事件訴訟法 | 7 | NO | exact_law_name |
| `337AC0000000152` | 地方公務員等共済組合法 | 7 | NO | exact_law_name |
| `347AC0000000086` | 新都市基盤整備法 | 7 | NO | exact_law_name |
| `348AC0000000118` | 水源地域対策特別措置法 | 7 | NO | exact_law_name |
| `407AC0000000086` | 更生保護事業法 | 7 | NO | exact_law_name |
| `416AC0000000154` | 信託業法 | 7 | NO | exact_law_name |
| `419AC0000000102` | 電子記録債権法 | 7 | NO | exact_law_name |
| `322AC0000000035` | 会計法 | 6 | NO | exact_law_name |
| `323AC0000000103` | 公認会計士法 | 6 | NO | exact_law_name |
| `323AC0000000130` | 船員職業安定法 | 6 | NO | exact_law_name |
| `324AC1000000283` | 身体障害者福祉法 | 6 | NO | exact_law_name |
| `326AC0000000180` | 国土調査法 | 6 | NO | exact_law_name |
| `326AC1000000193` | 公営住宅法 | 6 | NO | exact_law_name |
| `346CO0000000332` | 勤労者財産形成促進法施行令 | 6 | NO | exact_law_name |
| `347AC0000000057` | 労働安全衛生法 | 6 | NO | exact_law_name |
| `362AC0000000071` | 総合保養地域整備法 | 6 | NO | exact_law_name |
| `407M50000400077` | 電気事業法施行規則 | 6 | NO | exact_law_name |
| `416AC0000000110` | 景観法 | 6 | NO | exact_law_name |
| `419AC0000000074` | 株式会社商工組合中央金庫法 | 6 | NO | exact_law_name |
| `430AC0000000080` | 特定複合観光施設区域整備法 | 6 | NO | exact_law_name |
| `132AC0000000046` | 船舶法 | 5 | NO | exact_law_name |
| `323AC0000000120` | 国家行政組織法 | 5 | NO | exact_law_name |
| `323AC0000000165` | 農業改良助長法 | 5 | NO | exact_law_name |
| `324AC0000000213` | 簡易郵便局法 | 5 | NO | exact_law_name |
| `325AC0000000129` | 造船法 | 5 | NO | exact_law_name |
| `325AC0000000132` | 放送法 | 5 | NO | exact_law_name |
| `327AC0000000187` | 長期信用銀行法 | 5 | NO | exact_law_name |
| `328AC0000000245` | 私立学校教職員共済法 | 5 | NO | exact_law_name |
| `331AC0000000007` | 道路整備特別措置法 | 5 | NO | exact_law_name |
| `332CO0000000336` | 水道法施行令 | 5 | NO | exact_law_name |
| `336AC0000000048` | 農業協同組合合併助成法 | 5 | NO | exact_law_name |
| `347AC0000000031` | 沖縄振興開発金融公庫法 | 5 | NO | exact_law_name |
| `349CO0000000387` | 国土利用計画法施行令 | 5 | NO | exact_law_name |
| `355M50000200034` | 農業経営基盤強化促進法施行規則 | 5 | NO | exact_law_name |
| `401AC0000000083` | 貨物自動車運送事業法 | 5 | NO | exact_law_name |
| `410AC0100000066` | 被災者生活再建支援法 | 5 | NO | exact_law_name |
| `411AC0000000103` | 独立行政法人通則法 | 5 | NO | exact_law_name |
| `414AC0000000154` | 会社更生法 | 5 | NO | exact_law_name |
| `414AC0000000171` | 独立行政法人労働者健康安全機構法 | 5 | NO | exact_law_name |
| `414AC0000000189` | 構造改革特別区域法 | 5 | NO | exact_law_name |
| `415CO0000000486` | 地方独立行政法人法施行令 | 5 | NO | exact_law_name |
| `417M60000002053` | 地域再生法施行規則 | 5 | NO | exact_law_name |
| `419AC0000000053` | 統計法 | 5 | NO | exact_law_name |
| `423AC0100000113` | 株式会社東日本大震災事業者再生支援機構法 | 5 | NO | exact_law_name |
| `429AC0000000035` | 農業競争力強化支援法 | 5 | NO | exact_law_name |
| `324AC0000000193` | 水防法 | 4 | NO | exact_law_name |
| `325AC1000000178` | 漁船法 | 4 | NO | exact_law_name |
| `326AC0000000126` | 宗教法人法 | 4 | NO | exact_law_name |
| `326AC1000000144` | 農産物検査法 | 4 | NO | exact_law_name |
| `326M50000800074` | 道路運送車両法施行規則 | 4 | NO | exact_law_name |
| `327AC0000000165` | 気象業務法 | 4 | NO | exact_law_name |
| `327AC1000000151` | 内航海運業法 | 4 | NO | exact_law_name |
| `330M50004000005` | 土地区画整理法施行規則 | 4 | NO | exact_law_name |
| `331AC0000000121` | 倉庫業法 | 4 | NO | exact_law_name |
| `333AC0000000057` | 分収林特別措置法 | 4 | NO | exact_law_name |
| `333CO0000000207` | 国家公務員共済組合法施行令 | 4 | NO | exact_law_name |
| `336AC0000000202` | 農業近代化資金融通法 | 4 | NO | exact_law_name |
| `342AC0000000078` | 漁業協同組合合併促進法 | 4 | NO | exact_law_name |
| `344CO0000000158` | 都市計画法施行令 | 4 | NO | exact_law_name |
| `345AC1000000071` | 全国新幹線鉄道整備法 | 4 | NO | exact_law_name |
| `347CO0000000186` | 沖縄振興開発金融公庫法施行令 | 4 | NO | exact_law_name |
| `350AC0000000028` | 作業環境測定法 | 4 | NO | exact_law_name |
| `353AC0000000026` | 特定空港周辺航空機騒音対策特別措置法 | 4 | NO | exact_law_name |
| `411AC0000000156` | 原子力災害対策特別措置法 | 4 | NO | exact_law_name |
| `415AC0000000077` | 特定都市河川浸水被害対策法 | 4 | NO | exact_law_name |
| `415AC0000000112` | 国立大学法人法 | 4 | NO | exact_law_name |
| `416AC0000000099` | 高速道路株式会社法 | 4 | NO | exact_law_name |
| `417AC0000000041` | 都市鉄道等利便増進法 | 4 | NO | exact_law_name |
| `418M60000010012` | 会社法施行規則 | 4 | NO | exact_law_name |
| `419AC0000000057` | 株式会社日本政策金融公庫法 | 4 | NO | exact_law_name |
| `423M60000002069` | 東日本大震災復興特別区域法施行規則 | 4 | NO | exact_law_name |
| `322AC0000000141` | 職業安定法 | 3 | NO | exact_law_name |
| `322AC0000000165` | 郵便法 | 3 | NO | exact_law_name |
| `323AC1000000194` | 政治資金規正法 | 3 | NO | exact_law_name |
| `323CO0000000326` | 医療法施行令 | 3 | NO | exact_law_name |
| `324AC0000000121` | 水先法 | 3 | NO | exact_law_name |
| `324AC0000000267` | 漁業法 | 3 | NO | exact_law_name |
| `325AC1000000202` | 建築士法 | 3 | NO | exact_law_name |
| `325CO0000000089` | 公職選挙法施行令 | 3 | NO | exact_law_name |
| `328AC0100000227` | 労働金庫法 | 3 | NO | exact_law_name |
| `329AC0000000162` | 警察法 | 3 | NO | exact_law_name |
| `331AC0000000080` | 空港法 | 3 | NO | exact_law_name |
| `331AC0000000082` | 国有資産等所在市町村交付金法 | 3 | NO | exact_law_name |
| `331AC0000000146` | 工業用水法 | 3 | NO | exact_law_name |
| `332AC0000000079` | 高速自動車国道法 | 3 | NO | exact_law_name |
| `336AC0000000238` | 児童扶養手当法 | 3 | NO | exact_law_name |
| `343AC0000000097` | 大気汚染防止法 | 3 | NO | exact_law_name |
| `344AC0000000052` | 漁業近代化資金融通法 | 3 | NO | exact_law_name |
| `347AC0000000085` | 自然環境保全法 | 3 | NO | exact_law_name |
| `347AC0000000088` | 熱供給事業法 | 3 | NO | exact_law_name |
| `358AC1000000032` | 貸金業法 | 3 | NO | exact_law_name |
| `361AC0000000087` | 日本国有鉄道改革法 | 3 | NO | exact_law_name |
| `404AC1000000110` | 大阪湾臨海地域開発整備法 | 3 | NO | exact_law_name |
| `408M50000040005` | 保険業法施行規則 | 3 | NO | exact_law_name |
| `414AC0000000126` | 独立行政法人農畜産業振興機構法 | 3 | NO | exact_law_name |
| `416CO0000000182` | 独立行政法人中小企業基盤整備機構法施行令 | 3 | NO | exact_law_name |
| `417M60000010018` | 不動産登記規則 | 3 | NO | exact_law_name |
| `421AC0000000063` | 株式会社地域経済活性化支援機構法 | 3 | NO | exact_law_name |
| `423M60000400045` | 経済産業省関係総合特別区域法施行規則 | 3 | NO | exact_law_name |
| `131AC0000000011` | 民法施行法 | 2 | NO | exact_law_name |
| `322AC0000000034` | 財政法 | 2 | NO | exact_law_name |
| `322AC0000000118` | 災害救助法 | 2 | NO | exact_law_name |
| `322AC0000000185` | 農業保険法 | 2 | NO | exact_law_name |
| `322AC0000000224` | 戸籍法 | 2 | NO | exact_law_name |
| `322AC1000000085` | 国会職員法 | 2 | NO | exact_law_name |
| `323AC0000000201` | 医師法 | 2 | NO | exact_law_name |
| `323M40000100050` | 医療法施行規則 | 2 | NO | exact_law_name |
| `324AC0000000188` | 測量法 | 2 | NO | exact_law_name |
| `324M50000800049` | 海上運送法施行規則 | 2 | NO | exact_law_name |
| `325AC0000000209` | 家畜改良増殖法 | 2 | NO | exact_law_name |
| `325AC0000000291` | 採石法 | 2 | NO | exact_law_name |
| `325AC1000000197` | 司法書士法 | 2 | NO | exact_law_name |
| `327AC1000000005` | 企業合理化促進法施行令 | 2 | NO | unique_prefix |
| `327AC1000000358` | 農山漁村電気導入促進法 | 2 | NO | exact_law_name |
| `328AC0000000196` | 信用保証協会法 | 2 | NO | exact_law_name |
| `328AC1000000143` | 商工会議所法 | 2 | NO | exact_law_name |
| `333AC0000000084` | 工業用水道事業法 | 2 | NO | exact_law_name |
| `333AC0000000128` | 国家公務員共済組合法 | 2 | NO | exact_law_name |
| `334AC0000000024` | 工場立地法 | 2 | NO | exact_law_name |
| `334AC0000000125` | 意匠法 | 2 | NO | exact_law_name |
| `335AC0000000037` | 知的障害者福祉法 | 2 | NO | exact_law_name |
| `335AC0000000089` | 商工会法 | 2 | NO | exact_law_name |
| `336CO0000000037` | 消防法施行令 | 2 | NO | exact_law_name |
| `336CO0000000405` | 児童扶養手当法施行令 | 2 | NO | exact_law_name |
| `338AC0000000134` | 新住宅市街地開発法 | 2 | NO | exact_law_name |
| `341AC0000000101` | 首都圏近郊緑地保全法 | 2 | NO | exact_law_name |
| `342CO0000000237` | 通関業法施行令 | 2 | NO | exact_law_name |
| `343AC1000000089` | 社会保険労務士法 | 2 | NO | exact_law_name |
| `344CO0000000232` | 都市再開発法施行令 | 2 | NO | exact_law_name |
| `346AC0000000035` | 卸売市場法 | 2 | NO | exact_law_name |
| `346AC0000000073` | 児童手当法 | 2 | NO | exact_law_name |
| `346CO0000000281` | 児童手当法施行令 | 2 | NO | exact_law_name |
| `346CO0000000338` | 旅行業法施行令 | 2 | NO | exact_law_name |
| `347AC0000000041` | 日本下水道事業団法 | 2 | NO | exact_law_name |
| `358AC1000000043` | 浄化槽法 | 2 | NO | exact_law_name |
| `359AC0000000061` | 湖沼水質保全特別措置法 | 2 | NO | exact_law_name |
| `401AC0000000065` | 特定農産加工業経営改善等臨時措置法 | 2 | NO | exact_law_name |
| `402AC0000000044` | 市民農園整備促進法 | 2 | NO | exact_law_name |
| `404AC0000000051` | 計量法 | 2 | NO | exact_law_name |
| `405AC0000000091` | 環境基本法 | 2 | NO | exact_law_name |
| `407CO0000000357` | 農産物検査法施行令 | 2 | NO | exact_law_name |
| `408AC0000000039` | 塩事業法 | 2 | NO | exact_law_name |
| `411AC0000000095` | 財務省設置法 | 2 | NO | exact_law_name |
| `411AC0000000162` | 国立研究開発法人情報通信研究機構法 | 2 | NO | exact_law_name |
| `411AC0000000176` | 国立研究開発法人量子科学技術研究開発機構法 | 2 | NO | exact_law_name |
| `413CO0000000424` | 確定給付企業年金法施行令 | 2 | NO | exact_law_name |
| `413M60000100175` | 確定拠出年金法施行規則 | 2 | NO | exact_law_name |
| `414AC0000000136` | 独立行政法人国際協力機構法 | 2 | NO | exact_law_name |
| `414AC0000000158` | 国立研究開発法人科学技術振興機構法 | 2 | NO | exact_law_name |
| `414AC0000000161` | 国立研究開発法人宇宙航空研究開発機構法 | 2 | NO | exact_law_name |
| `414AC0000000163` | 独立行政法人日本芸術文化振興会法 | 2 | NO | exact_law_name |
| `414AC0000000182` | 独立行政法人水資源機構法 | 2 | NO | exact_law_name |
| `414M60000800066` | 都市再生特別措置法施行規則 | 2 | NO | exact_law_name |
| `415M60000100122` | 次世代育成支援対策推進法施行規則 | 2 | NO | exact_law_name |
| `416AC0000000074` | 総合法律支援法 | 2 | NO | exact_law_name |
| `416CO0000000181` | 中小企業総合事業団法 | 2 | NO | unique_prefix |
| `416CO0000000398` | 景観法施行令 | 2 | NO | exact_law_name |
| `123AC0000000001` | 保管金規則 | 1 | NO | exact_law_name |
| `141AC0000000053` | 公証人法 | 1 | NO | exact_law_name |
| `210AC0000000057` | 公有水面埋立法 | 1 | NO | exact_law_name |
| `215IO0000000243` | 健康保険法施行令 | 1 | NO | exact_law_name |
| `306AC0000000042` | 無尽業法 | 1 | NO | exact_law_name |
| `321IO0000000118` | 物価統制令 | 1 | NO | exact_law_name |
| `322AC0000000226` | 消防組織法 | 1 | NO | exact_law_name |
| `322AC0000000234` | 理容師法 | 1 | NO | exact_law_name |
| `323AC0000000028` | 海上保安庁法 | 1 | NO | exact_law_name |
| `323AC0000000068` | 予防接種法 | 1 | NO | exact_law_name |
| `323AC0000000174` | 港則法 | 1 | NO | exact_law_name |
| `323AC0000000198` | 民生委員法 | 1 | NO | exact_law_name |
| `323AC0000000200` | 消費生活協同組合法 | 1 | NO | exact_law_name |
| `323AC0000000204` | 歯科衛生士法 | 1 | NO | exact_law_name |
| `323CO0000000246` | 国有財産法施行令 | 1 | NO | exact_law_name |
| `324AC0000000070` | 鉱山保安法 | 1 | NO | exact_law_name |
| `324AC0000000117` | 国家公務員宿舎法 | 1 | NO | exact_law_name |
| `324AC0000000186` | 獣医師法 | 1 | NO | exact_law_name |
| `324AC1000000205` | 弁護士法 | 1 | NO | exact_law_name |
| `325AC0000000149` | 火薬類取締法 | 1 | NO | exact_law_name |
| `325AC0000000290` | 鉱業法施行法 | 1 | NO | exact_law_name |
| `325AC1000000228` | 土地家屋調査士法 | 1 | NO | exact_law_name |
| `325M50000400088` | 火薬類取締法施行規則 | 1 | NO | exact_law_name |
| `326AC0100000161` | 港湾運送事業法 | 1 | NO | exact_law_name |
| `326AC1000000004` | 行政書士法 | 1 | NO | exact_law_name |
| `326CO0000000250` | 道路運送法施行令 | 1 | NO | exact_law_name |
| `326M50000800072` | 優良自動車整備事業者認定規則 | 1 | NO | exact_law_name |
| `327AC0000000195` | 貸付信託法 | 1 | NO | exact_law_name |
| `327AC1000000028` | 漁船損害等補償法 | 1 | NO | exact_law_name |
| `327AC1000000305` | 日本赤十字社法 | 1 | NO | exact_law_name |
| `327CO0000000445` | 農地法施行令 | 1 | NO | exact_law_name |
| `327M50000800056` | 航空法施行規則 | 1 | NO | exact_law_name |
| `327M50010000079` | 農地法施行規則 | 1 | NO | exact_law_name |
| `328AC0000000096` | 有線電気通信法 | 1 | NO | exact_law_name |
| `328AC1000000064` | 北海道防寒住宅建設等促進法施行令 | 1 | NO | unique_prefix |
| `328CO0000000240` | 船員保険法施行令 | 1 | NO | exact_law_name |
| `328CO0000000340` | 学校教育法施行令 | 1 | NO | exact_law_name |
| `330AC0000000168` | 歯科技工士法 | 1 | NO | exact_law_name |
| `331AC0000000101` | 海岸法 | 1 | NO | exact_law_name |
| `331CO0000000319` | 道路整備特別措置法施行令 | 1 | NO | exact_law_name |
| `332AC0000000161` | 自然公園法 | 1 | NO | exact_law_name |
| `332AC1000000163` | 美容師法 | 1 | NO | exact_law_name |
| `333AC0000000079` | 下水道法 | 1 | NO | exact_law_name |
| `333CO0000000362` | 国民健康保険法施行令 | 1 | NO | exact_law_name |
| `334AC0000000121` | 特許法 | 1 | NO | exact_law_name |
| `334AC0000000123` | 実用新案法 | 1 | NO | exact_law_name |
| `335CO0000000270` | 道路交通法施行令 | 1 | NO | exact_law_name |
| `337CO0000000288` | 災害対策基本法施行令 | 1 | NO | exact_law_name |
| `337M50000040052` | 契約事務取扱規則 | 1 | NO | exact_law_name |
| `338AC0000000101` | 中小企業投資育成株式会社法 | 1 | NO | exact_law_name |
| `340CO0000000321` | 金融商品取引法施行令 | 1 | NO | exact_law_name |
| `341AC1000000133` | 日本勤労者住宅協会法 | 1 | NO | exact_law_name |
| `342M50000040008` | 公認会計士等登録規則 | 1 | NO | exact_law_name |
| `344AC0000000049` | 地価公示法 | 1 | NO | exact_law_name |
| `344AC0000000064` | 職業能力開発促進法職業能力開発促進法 | 1 | NO | unique_prefix |
| `344M50004000049` | 都市計画法施行規則 | 1 | NO | exact_law_name |
| `345AC0000000048` | 著作権法 | 1 | NO | exact_law_name |
| `345AC0000000138` | 水質汚濁防止法 | 1 | NO | exact_law_name |
| `345AC1000000019` | 柔道整復師法 | 1 | NO | exact_law_name |
| `346AC0000000032` | 農地所有者等賃貸住宅建設融資利子補給臨時措置法 | 1 | NO | exact_law_name |
| `346M50010000052` | 卸売市場法施行規則 | 1 | NO | exact_law_name |
| `348AC0000000026` | 金属鉱業等鉱害対策特別措置法 | 1 | NO | exact_law_name |
| `348AC1000000110` | 瀬戸内海環境保全特別措置法 | 1 | NO | exact_law_name |
| `348CO0000000286` | 中小小売商業振興法施行令 | 1 | NO | exact_law_name |
| `350M50002000003` | 雇用保険法施行規則 | 1 | NO | exact_law_name |
| `353AC0000000036` | 森林組合法 | 1 | NO | exact_law_name |
| `361AC0000000093` | 日本国有鉄道改革法等施行法 | 1 | NO | exact_law_name |
| `361CO0000000243` | 半島振興法施行令 | 1 | NO | exact_law_name |
| `362M50000800006` | 鉄道事業法施行規則 | 1 | NO | exact_law_name |
| `363AC0000000040` | 港湾労働法 | 1 | NO | exact_law_name |
| `363AC0000000098` | 肉用子牛生産安定等特別措置法 | 1 | NO | exact_law_name |
| `402CO0000000304` | 国民年金基金令 | 1 | NO | exact_law_name |
| `402M50000800021` | 貨物自動車運送事業法施行規則 | 1 | NO | exact_law_name |
| `403AC0000000036` | 救急救命士法 | 1 | NO | exact_law_name |
| `409AC0000000132` | 言語聴覚士法 | 1 | NO | exact_law_name |
| `410M50000100005` | 理容師養成施設指定規則 | 1 | NO | exact_law_name |
| `410M50000100008` | 美容師養成施設指定規則 | 1 | NO | exact_law_name |
| `411AC0000000100` | 国土交通省設置法 | 1 | NO | exact_law_name |
| `413CO0000000310` | 浄化槽法施行令 | 1 | NO | exact_law_name |
| `414AC0000000122` | 知的財産基本法 | 1 | NO | exact_law_name |
| `414AC0000000183` | 独立行政法人自動車事故対策機構法 | 1 | NO | exact_law_name |
| `414M60000100022` | 確定給付企業年金法施行規則 | 1 | NO | exact_law_name |
| `415AC0000000094` | 独立行政法人日本学生支援機構法 | 1 | NO | exact_law_name |
| `415AC0000000100` | 独立行政法人都市再生機構法 | 1 | NO | exact_law_name |
| `415CO0000000343` | 独立行政法人農業者年金基金法施行令 | 1 | NO | exact_law_name |
| `416AC0000000155` | 国立研究開発法人日本原子力研究開発機構法 | 1 | NO | exact_law_name |
| `416M60000002018` | 公認会計士試験規則 | 1 | NO | exact_law_name |
| `419AC0000000085` | 株式会社日本政策投資銀行法 | 1 | NO | exact_law_name |
| `419AC0000000128` | 労働契約法 | 1 | NO | exact_law_name |
| `423AC1000000076` | 東日本大震災復興基本法 | 1 | NO | exact_law_name |
| `427M60000A08002` | 半島振興法施行規則 | 1 | NO | exact_law_name |
| `429AC0000000065` | 住宅宿泊事業法 | 1 | NO | exact_law_name |
| `501AC1000000050` | 愛玩動物看護師法 | 1 | NO | exact_law_name |
| `508AC0000000061` | 防災庁設置法 | 1 | NO | exact_law_name |

## Ledger name aliases (already acquired under another title)

| name | law_id | occurrences | method |
|---|---|---:|---|
| 沖縄振興開発特別措置法 | `404M50000008008` | 10 | unique_prefix |
| 租税特別措置法施行令租税特別措置法 | `332CO0000000043` | 5 | unique_prefix |

## Unresolved names (kept as uncertainty, not silently dropped)

| name | occurrences |
|---|---:|
| 施行令 | 2592 |
| 改正法 | 554 |
| 震災特例法 | 533 |
| 旧効力措置法 | 383 |
| 特別措置法 | 318 |
| 外国居住者等所得相互免除法 | 271 |
| 四年新措置法 | 250 |
| 法律施行令 | 226 |
| 四年旧措置法 | 215 |
| 旧震災特例法 | 212 |
| 租税条約等実施特例法 | 209 |
| 第三条新令 | 207 |
| 第四条新令 | 174 |
| 整備法 | 168 |
| 第五条新令 | 149 |
| 新震災特例法 | 144 |
| 第六条新令 | 138 |
| 第七条新令 | 123 |
| 法律施行規則 | 121 |
| 第八条新令 | 109 |
| 一施行令 | 101 |
| 第九条新令 | 100 |
| 租税条約等実施特例省令 | 99 |
| 四年新法 | 91 |
| 第二条法 | 89 |
| 新租特法 | 85 |
| 第三条新規則 | 85 |
| 第三条法 | 83 |
| 平成二十五年旧租特法 | 81 |
| 改正令 | 79 |
| 旧農用地整備公団法 | 77 |
| 第十一条新令 | 76 |
| 第一条中所得税法 | 75 |
| 旧復興特区法 | 74 |
| 平成二十三年旧法 | 72 |
| 平成二十二年旧法 | 72 |
| 第四条新規則 | 72 |
| 災害減免令 | 70 |
| 措置法 | 67 |
| 第十条新令 | 67 |
| 十一法 | 65 |
| 第四条法 | 65 |
| 第三条新法 | 64 |
| 事業法 | 62 |
| 元年旧地方税法 | 62 |
| 第五条新法 | 62 |
| 石油税法 | 61 |
| 書類二法 | 60 |
| 番号利用法整備令 | 60 |
| 平成七年旧法 | 59 |
| 第五条新規則 | 59 |
| 旧効力連結措置法 | 58 |
| 令和四年度省令 | 57 |
| 保安規則 | 56 |
| 一所得税法 | 55 |
| 二所得税法 | 55 |
| 第六条新法 | 55 |
| 第十二条新令 | 55 |
| 四年旧震災特例法 | 54 |
| 第五条法 | 54 |
| 第十三条新令 | 53 |
| 第四条新法 | 53 |
| 十二法 | 52 |
| 場合法 | 52 |
| 旧効力単体措置法 | 51 |
| 物品税法 | 51 |
| 第九条新法 | 51 |
| 第十四条新法 | 50 |
| 平成三年旧法 | 49 |
| 平成十二年旧法 | 49 |
| 第八条新法 | 49 |
| 第六条新規則 | 49 |
| 第十五条新令 | 49 |
| 第十四条新令 | 49 |
| 二施行令 | 48 |
| 平成七年新法 | 48 |
| 番号利用法整備法 | 47 |
| 第七条新法 | 47 |
| 第六条法 | 47 |
| 第十二条新法 | 47 |
| 令和三年度省令 | 46 |
| 令和六年度省令 | 46 |
| 医薬品医療機器等法 | 46 |
| 所得税法等改正法 | 46 |
| 円滑化省令 | 45 |
| 四年新震災特例法 | 45 |
| 第七条法 | 45 |
| 免除外国居住者等所得相互免除法 | 44 |
| 三所得税法 | 43 |
| 氏名二法 | 43 |
| 第十三条新法 | 43 |
| 十三法 | 42 |
| 平成二十一年旧法 | 42 |
| 平成十三年旧法 | 42 |
| 復興庁設置法等改正法 | 42 |
| 第二条中法人税法 | 42 |
| 第十六条新法 | 42 |
| 一法人税法 | 41 |
| 三施行令 | 41 |
| 第十条新法 | 41 |
