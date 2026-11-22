# Coverage ledger (machine-generated)

Do not hand-edit. Regenerate with `python scripts/ci/coverage_ledger.py`.
Every number below is computed from a machine-generated input. Axes have
DIFFERENT denominators and are deliberately NOT combined into a completion
percentage. Reading a law into the corpus is not semantic modelling; a
fidelity-only literal check is not legal review.

snapshot_date: 2026-11-15
objective_baseline_date: 2026-11-17 (JST; as stated in the directive)

## Law-level axes (denominator = laws in INVENTORY)

| axis | count | denominator | rate |
|---|---:|---:|---:|
| laws in ledger | 327 | 327 | 100.00% |
| current-enforced (auditable) laws | 324 | 327 | 99.08% |
| laws with pinned raw snapshot | 325 | 327 | 99.39% |
| laws with >=1 pinned literal check | 124 | 327 | 37.92% |
| unresolved (unenforced) laws | 2 | 327 | 0.61% |

## Structural sweep axes (denominator = structural units checked)

| axis | count |
|---|---:|
| laws parse-ok | 325 |
| laws audit-ok | 325 |
| articles checked | 42584 |
| paragraphs checked | 86403 |
| items checked | 61672 |
| verified anomalies | 0 |
| unreviewed candidates | 3438 |

## Reference-relation axes (Objective §1 — recursive discovery)

| axis | count |
|---|---:|
| references extracted | 476500 |
| internal references checked | 63234 |
| external references NOT bound to the ledger | 175186 |
| references classified unsupported | 250043 |

external_unverified references are NOT verified and are NOT silently counted
as covered scope.

## Related-statute discovery axes (Objective §2, SEPARATE denominator)

| axis | count |
|---|---:|
| official national law-list entries | 9001 |
| unmatched reference names from pinned snapshots | 7524 |
| related statutes resolved to official law ids, NOT in ledger | 380 |
| reference names aliased to laws already in ledger | 0 |
| unresolved reference names (uncertainty retained) | 7053 |
| related statutes ACQUIRED in separate layer (not in ledger) | 2 |

Discovered law ids are NOT added to INVENTORY, NOT acquired, NOT parsed,
NOT formalised and NOT reviewed. They are a separate discovery denominator
and must never be merged into the 'laws in ledger' completion rate.

## Formalisation axes (denominator = distinct laws / article pins)

| axis | count | denominator | rate |
|---|---:|---:|---:|
| pinned literal checks | 359 | n/a | n/a |
| distinct article pins | 150 | 42584 | 0.35% |
| pinned Lean modules (cross-law) | 791 | n/a | n/a |

## Unaddressed / unproved / candidate-inconsistency axes (Objective §4)

| axis | count |
|---|---:|
| unpinned Lean modules (not counted as verified) | 380 |
| L7 candidates awaiting human legal review | 3438 |
| verified anomalies (requires independent review to establish) | 0 |
| unresolved (unenforced) laws | 2 |
| external references NOT bound to the ledger | 175186 |
| related statutes discovered but not acquired (Objective §2) | 380 |
| related statutes acquired but not parsed/modelled/reviewed | 2 |

An unpinned module, an unreviewed candidate, an unbound reference and an
unenforced law are NOT counted as verified or completed. verified-anomaly = 0
means no independent legal review has established a defect; it is not
evidence of absence of defects.

## Independent transcription-review axis (Objective §4, separate from fidelity-only audit)

| axis | count |
|---|---:|
| adversarial review sessions recorded | 66 |

These are machine-based independent cross-checks by a separate review
agent, NOT human legal review and NOT a count of fully reviewed articles.

## Human legal review axis (denominator = L7 candidates)

| axis | count | denominator | rate |
|---|---:|---:|---:|
| candidates with recorded reviewer | 0 | 3438 | 0.00% |
| candidates with recorded review_date | 0 | n/a | n/a |
| candidates with H/T/D/C/U complete | 3438 | 3438 | 100.00% |

H/T/D/C/U are review-protocol records (falsifiable hypothesis,
reproduction test, decision, competing interpretation, uncertainty).
They are NOT findings of a defect and NOT human legal review.

verified-anomaly = 0 means zero independent legal review has established
any candidate as an anomaly; it is NOT evidence that no defect exists.

## Laws with pinned literal checks

- `143AC0000000054` 関税定率法
- `322AC0000000175` 昭和二十二年法律第百七十五号（災害被害者に対する租税の減免、徴収猶予等に関する法律）
- `322CO0000000109` 昭和二十二年政令第百九号（財産税法等による物納に因る不動産登記の特例に関する政令）
- `322CO0000000268` 昭和二十二年政令第二百六十八号（災害被害者に対する租税の減免、徴収猶予等に関する法律の施行に関する政令）
- `325AC0000000073` 相続税法
- `325AC0000000211` 地方交付税法
- `325AC0000000226` 地方税法
- `325CO0000000071` 相続税法施行令
- `325CO0000000245` 地方税法施行令
- `325M50000040017` 相続税法施行規則
- `326AC1000000145` 納税貯蓄組合法
- `326AC1000000237` 税理士法
- `326CO0000000099` 納税貯蓄組合法施行令
- `326CO0000000216` 税理士法施行令
- `326M50000040055` 税理士法施行規則
- `327AC0000000111` 日本国とアメリカ合衆国との間の相互協力及び安全保障条約第六条に基づく施設及び区域並びに日本国における合衆国軍隊の地位に関する協定の実施に伴う所得税法等の臨時特例に関する法律
- `327AC0000000112` 日本国とアメリカ合衆国との間の相互協力及び安全保障条約第六条に基づく施設及び区域並びに日本国における合衆国軍隊の地位に関する協定の実施に伴う関税法等の臨時特例に関する法律
- `327CO0000000125` 日本国とアメリカ合衆国との間の相互協力及び安全保障条約第六条に基づく施設及び区域並びに日本国における合衆国軍隊の地位に関する協定の実施に伴う関税法等の臨時特例に関する法律施行令
- `328AC0000000006` 酒税法
- `328AC0000000007` 酒税の保全及び酒類業組合等に関する法律
- `328CO0000000028` 酒税の保全及び酒類業組合等に関する法律施行令
- `328CO0000000407` 奄美群島の復帰に伴う国税関係法令の適用の暫定措置等に関する政令
- `328M50000040011` 酒税の保全及び酒類業組合等に関する法律施行規則
- `329AC0000000061` 関税法
- `329AC0000000112` 日本国とアメリカ合衆国との間の相互防衛援助協定の実施に伴う関税法等の臨時特例に関する法律
- `329AC0000000149` 日本国における国際連合の軍隊の地位に関する協定の実施に伴う所得税法等の臨時特例に関する法律
- `329CO0000000051` 国税収納金整理資金に関する法律施行令
- `329CO0000000150` 関税法施行令
- `329CO0000000155` 関税定率法施行令
- `329CO0000000164` 税関関係手数料令
- `329M50000002023` 地方税法施行規則
- `329M50000040039` 国税収納金整理資金事務取扱規則
- `330AC0000000037` 輸入品に対する内国消費税の徴収等に関する法律
- `330AC0000000104` 地方揮発油税法
- `330AC0000000113` 地方揮発油譲与税法
- `330CO0000000100` 輸入品に対する内国消費税の徴収等に関する法律施行令
- `332AC0000000026` 租税特別措置法
- `332AC0000000037` とん税法
- `332AC0000000038` 特別とん税法
- `332AC0000000055` 揮発油税法
- `332CO0000000043` 租税特別措置法施行令
- `332CO0000000057` 揮発油税法施行令
- `332M50000040015` 租税特別措置法施行規則
- `334AC0000000147` 国税徴収法
- `334CO0000000329` 国税徴収法施行令
- `335AC0000000036` 関税暫定措置法
- `335CO0000000069` 関税暫定措置法施行令
- `337AC0000000066` 国税通則法
- `337CO0000000097` 酒税法施行令
- `337CO0000000227` 外国居住者等の所得に対する相互主義による所得税等の非課税等に関する法律施行令
- `337M50000008017` 普通交付税に関する省令
- `337M50000040026` 酒税法施行規則
- `337M50000040028` 国税通則法施行規則
- `339CO0000000182` 自家用自動車の一時輸入に関する通関条約の実施に伴う関税法等の特例に関する法律施行令
- `340AC0000000033` 所得税法
- `340AC0000000034` 法人税法
- `340AC0000000156` 石油ガス税法
- `340AC0000000157` 石油ガス譲与税法
- `340CO0000000096` 所得税法施行令
- `340CO0000000097` 法人税法施行令
- `340M50000040011` 所得税法施行規則
- `340M50000040012` 法人税法施行規則
- `341CO0000000005` 石油ガス税法施行令
- `341M50000008002` 石油ガス譲与税法施行規則
- `342AC0000000023` 印紙税法
- `342AC0000000035` 登録免許税法
- `342CO0000000108` 印紙税法施行令
- `342CO0000000146` 登録免許税法施行令
- `342M50000040037` 登録免許税法施行規則
- `344M50000040016` 関税定率法施行規則
- `345M50000040017` 国税不服審判所組織規則
- `346AC0000000065` コンテナーに関する通関条約及び国際道路運送手帳による担保の下で行なう貨物の国際運送に関する通関条約（ＴＩＲ条約）の実施に伴う関税法等の特例に関する法律
- `346AC0000000089` 自動車重量税法
- `346AC0000000090` 自動車重量譲与税法
- `346CO0000000257` コンテナーに関する通関条約及び国際道路運送手帳による担保の下で行なう貨物の国際運送に関する通関条約（ＴＩＲ条約）の実施に伴う関税法等の特例に関する法律施行令
- `346CO0000000275` 自動車重量税法施行令
- `346M50000040066` 自動車重量税法施行規則
- `347AC0000000007` 航空機燃料税法
- `347CO0000000057` 航空機燃料税法施行令
- `347CO0000000151` 沖縄の復帰に伴う国税関係法令の適用の特別措置等に関する政令
- `347CO0000000161` 沖縄の復帰に伴う地方税法の適用の特別措置等に関する政令
- `347M50000008013` 沖縄の復帰に伴う地方税法等の適用の特別措置等に関する省令
- `347M50000008026` 航空機燃料譲与税法施行規則
- `347M50000040044` 沖繩の復帰に伴う国税関係以外の大蔵省関係法令の適用の特別措置等に関する省令
- `348AC0000000102` 特定市街化区域農地の固定資産税の課税の適正化に伴う宅地化促進臨時措置法
- `349AC0000000079` 電源開発促進税法
- `351M50000008035` 特別交付税に関する省令
- `352M50000040032` 国税局課税部等の統括国税調査官等の所掌に属する事務の範囲を定める省令
- `353AC0000000025` 石油石炭税法
- `359AC0000000072` たばこ税法
- `363AC0000000107` 税制改革法
- `363AC0000000108` 消費税法
- `363CO0000000360` 消費税法施行令
- `363M50000040053` 消費税法施行規則
- `403AC0000000069` 地価税法
- `403CO0000000174` 地価税法施行令
- `404AC0000000015` 法人特別税法
- `405M50000008001` 離島振興法第二十条の地方税の課税免除又は不均一課税に伴う措置が適用される場合等を定める省令
- `407CO0000000029` 阪神・淡路大震災の被災者等に係る国税関係法律の臨時特例に関する法律施行令
- `409CO0000000363` 内国税の適正な課税の確保を図るための国外送金等に係る調書の提出等に関する法律施行令
- `412CO0000000277` 関税等不服審査会令
- `414CO0000000262` ポリエステル短繊維に対して課する不当廉売関税に関する政令
- `415M60000008069` 収入印紙及び自動車重量税印紙の売りさばきに関する省令
- `415M60000040007` 税関関係法令に係る情報通信技術を活用した行政の推進等に関する省令
- `417M60000200012` 経済連携協定に基づく農林水産省の所掌事務に係る物資の関税割当制度に関する省令
- `418M60000008099` 納税証明書、住民票等の写し等又は印鑑登録証明書の交付の請求の受付及び引渡しの業務の公共サービス実施民間事業者における実施に関する省令
- `420AC0000000084` 地方税等減収補てん臨時交付金に関する法律
- `420M60000008116` 地方税等減収補てん臨時交付金に関する省令
- `423AC0000000029` 東日本大震災の被災者等に係る国税関係法律の臨時特例に関する法律
- `426AC0000000011` 地方法人税法
- `426CO0000000415` トルエンジイソシアナートに対して課する不当廉売関税に関する政令
- `428CO0000000196` 水酸化カリウムに対して課する不当廉売関税に関する政令
- `429CO0000000234` 高重合度ポリエチレンテレフタレートに対して課する不当廉売関税に関する政令
- `430AC0000000016` 国際観光旅客税法
- `431AC0000000003` 森林環境税及び森林環境譲与税に関する法律
- `431AC0000000004` 特別法人事業税及び特別法人事業譲与税に関する法律
- `431M60000008040` 森林環境税及び森林環境譲与税に関する法律施行規則
- `502AC0000000025` 新型コロナウイルス感染症等の影響に対応するための国税関係法律の臨時特例に関する法律
- `502CO0000000160` 新型コロナウイルス感染症等の影響に対応するための国税関係法律の臨時特例に関する法律施行令
- `502CO0000000208` トリス（クロロプロピル）ホスフェートに対して課する不当廉売関税に関する政令
- `503CO0000000065` 炭酸二カリウムに対して課する不当廉売関税に関する政令
- `504CO0000000372` 溶融亜鉛めっき鉄線に対して課する不当廉売関税に関する政令
- `507CO0000000095` 黒鉛電極に対して課する不当廉売関税に関する政令
- `508CO0000000254` 溶融亜鉛めっき鋼帯及び鋼板に対して課する暫定的な不当廉売関税に関する政令
