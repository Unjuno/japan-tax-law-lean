# 構造監査レポート — 日本税法 R1 (2026-11-15)
- 基準日: 2026-11-15 (JST)
- 対象: 所得税法 (340AC0000000033) ・ 所得税法施行令 (340CO0000000096)
- 方法: e-Gov 法令検索 API v2 (law_revisions / law_data) から適用版XMLを取得し、正規化後に機械検査。
- 判定: 候補 (candidate) は**独立レビューを受けていない**。法的欠陥の確定は本レポートではない。

## 1. 適用法令版 (pinned provenance)

### 所得税法 (昭和四十年法律第三十三号)
- Law ID: `340AC0000000033`
- 公布: 1965-03-31
- 適用 revision ID: `340AC0000000033_20261001_507AC0000000070`
- 改正法令: 日本学術会議法 (令和七年法律第七十号, 施行 2026-10-01)
- 公式ページ: https://laws.e-gov.go.jp/law/340AC0000000033
- API URL: https://laws.e-gov.go.jp/api/2/law_data/340AC0000000033_20261001_507AC0000000070
- ファイル: `data/raw/340AC0000000033_20261001_507AC0000000070.law.json`
- SHA-256: `94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B`

### 所得税法施行令 (昭和四十年政令第九十六号)
- Law ID: `340CO0000000096`
- 公布: 1965-03-31
- 適用 revision ID: `340CO0000000096_20260522_508CO0000000093`
- 改正法令: 所得税法施行令の一部を改正する政令 (令和八年政令第九十三号, 施行 2026-05-22)
- 公式ページ: https://laws.e-gov.go.jp/law/340CO0000000096
- API URL: https://laws.e-gov.go.jp/api/2/law_data/340CO0000000096_20260522_508CO0000000093
- ファイル: `data/raw/340CO0000000096_20260522_508CO0000000093.law.json`
- SHA-256: `9FACF2E2768D602CCDBBF9891DF142D3A3E7EAD09033EB0634DE00A4C4181392`

## 2. 検査の統計

### 所得税法
- 条文数(枝番号含む): 1323
- 項: 2245 / 号(含細目): 1434
- 参照抽出: 11123 / 内部検査: 3455 / 他律・未検査: 3089 / 未対応: 5453
- ファイルSHA-256: `94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B`

### 所得税法施行令
- 条文数(枝番号含む): 1365
- 項: 2427 / 号(含細目): 2091
- 参照抽出: 12928 / 内部検査: 3608 / 他律・未検査: 4139 / 未対応: 6560
- ファイルSHA-256: `9FACF2E2768D602CCDBBF9891DF142D3A3E7EAD09033EB0634DE00A4C4181392`

## 3. 検証状態サマリ
- 検証済み構造異常 (verified-anomaly): **0**
- 要確認候補 (candidate): **22**
- 情報 (info): **0**

## 4. 構造異常 (verified-anomaly)
検出なし。

## 5. 要確認候補 (candidate — 欠陥を意味しない)

独立レビュー未実施・別解釈あり・モデル由来の可能性を含む。

### 1. [PAREN.UNBALANCED] SP:idx-345/Article 3

- 法令: 所得税法 (340AC0000000033)
- 行 (正規化テキスト): 3663
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: PAREN.UNBALANCED
- 内容: Unmatched closing quote '」' in SP:idx-345/Article 3
- 証跡: offset 665 in article text
- 検証状態: **未確定 — 独立レビュー未実施**
### 2. [PAREN.UNBALANCED] SP:idx-345/Article 3

- 法令: 所得税法 (340AC0000000033)
- 行 (正規化テキスト): 3663
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: PAREN.UNBALANCED
- 内容: Unmatched closing quote '」' in SP:idx-345/Article 3
- 証跡: offset 765 in article text
- 検証状態: **未確定 — 独立レビュー未実施**
### 3. [REF.PARA.MISSING] MAIN/Article 151_6

- 法令: 所得税法 (340AC0000000033)
- 行 (正規化テキスト): 1060
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: REF.PARA.MISSING
- 内容: Reference to paragraph 4 but neither enclosing article 151_6 (paragraphs [1, 2, 3]) nor antecedent article 151_6 (paragraphs [1, 2, 3]) contains it
- 証跡: sentence: この場合において、同条第四項第一号及び第二号中「第一項又は第二項に規定する提出期限」とあるのは「第百五十一条の六第一項（遺産分割等があつた場合の修正申告の特例）に規定する提出期限」と、同号中「第百五十一条の四第一項又は第二項（相続により取得した有価証券等の取得費の額に変更があつた場合等の修正申告の特例）」とあるのは「第
- 検証状態: **未確定 — 独立レビュー未実施**
### 4. [REF.PARA.MISSING] MAIN/Article 152

- 法令: 所得税法 (340AC0000000033)
- 行 (正規化テキスト): 1066
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: REF.PARA.MISSING
- 内容: Reference to paragraph 3 but neither enclosing article 152 (paragraphs [1]) nor antecedent article - (paragraphs -) contains it
- 証跡: sentence: この場合においては、更正請求書には、同条第三項に規定する事項のほか、当該事実が生じた日を記載しなければならない。
- 検証状態: **未確定 — 独立レビュー未実施**
### 5. [PAREN.UNBALANCED] MAIN/Article 292

- 法令: 所得税法施行令 (340CO0000000096)
- 行 (正規化テキスト): 2197
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: PAREN.UNBALANCED
- 内容: Unmatched closing bracket '）' in MAIN/Article 292
- 証跡: offset 2083 in article text
- 検証状態: **未確定 — 独立レビュー未実施**
### 6. [PAREN.UNBALANCED] MAIN/Article 292

- 法令: 所得税法施行令 (340CO0000000096)
- 行 (正規化テキスト): 2197
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: PAREN.UNBALANCED
- 内容: Unmatched closing bracket '）' in MAIN/Article 292
- 証跡: offset 2111 in article text
- 検証状態: **未確定 — 独立レビュー未実施**
### 7. [PAREN.UNBALANCED] MAIN/Article 292

- 法令: 所得税法施行令 (340CO0000000096)
- 行 (正規化テキスト): 2197
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: PAREN.UNBALANCED
- 内容: Unclosed bracket '（' in MAIN/Article 292
- 証跡: offset 2467 in article text
- 検証状態: **未確定 — 独立レビュー未実施**
### 8. [PAREN.UNBALANCED] MAIN/Article 292

- 法令: 所得税法施行令 (340CO0000000096)
- 行 (正規化テキスト): 2197
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: PAREN.UNBALANCED
- 内容: Unclosed bracket '（' in MAIN/Article 292
- 証跡: offset 2470 in article text
- 検証状態: **未確定 — 独立レビュー未実施**
### 9. [PAREN.UNBALANCED] MAIN/Article 292

- 法令: 所得税法施行令 (340CO0000000096)
- 行 (正規化テキスト): 2197
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: PAREN.UNBALANCED
- 内容: Unclosed bracket '（' in MAIN/Article 292
- 証跡: offset 2691 in article text
- 検証状態: **未確定 — 独立レビュー未実施**
### 10. [PAREN.UNBALANCED] MAIN/Article 292

- 法令: 所得税法施行令 (340CO0000000096)
- 行 (正規化テキスト): 2197
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: PAREN.UNBALANCED
- 内容: Unclosed bracket '（' in MAIN/Article 292
- 証跡: offset 2696 in article text
- 検証状態: **未確定 — 独立レビュー未実施**
### 11. [PAREN.UNBALANCED] MAIN/Article 292

- 法令: 所得税法施行令 (340CO0000000096)
- 行 (正規化テキスト): 2197
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: PAREN.UNBALANCED
- 内容: Unclosed bracket '（' in MAIN/Article 292
- 証跡: offset 2741 in article text
- 検証状態: **未確定 — 独立レビュー未実施**
### 12. [PAREN.UNBALANCED] MAIN/Article 292

- 法令: 所得税法施行令 (340CO0000000096)
- 行 (正規化テキスト): 2197
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: PAREN.UNBALANCED
- 内容: Unclosed bracket '（' in MAIN/Article 292
- 証跡: offset 2744 in article text
- 検証状態: **未確定 — 独立レビュー未実施**
### 13. [PAREN.UNBALANCED] MAIN/Article 292

- 法令: 所得税法施行令 (340CO0000000096)
- 行 (正規化テキスト): 2197
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: PAREN.UNBALANCED
- 内容: Unclosed bracket '（' in MAIN/Article 292
- 証跡: offset 2787 in article text
- 検証状態: **未確定 — 独立レビュー未実施**
### 14. [PAREN.UNBALANCED] MAIN/Article 292

- 法令: 所得税法施行令 (340CO0000000096)
- 行 (正規化テキスト): 2197
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: PAREN.UNBALANCED
- 内容: Unclosed bracket '（' in MAIN/Article 292
- 証跡: offset 2790 in article text
- 検証状態: **未確定 — 独立レビュー未実施**
### 15. [PAREN.UNBALANCED] SP:idx-5/Article 5

- 法令: 所得税法施行令 (340CO0000000096)
- 行 (正規化テキスト): 2731
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: PAREN.UNBALANCED
- 内容: Unclosed bracket '（' in SP:idx-5/Article 5
- 証跡: offset 673 in article text
- 検証状態: **未確定 — 独立レビュー未実施**
### 16. [PAREN.UNBALANCED] SP:idx-5/Article 5

- 法令: 所得税法施行令 (340CO0000000096)
- 行 (正規化テキスト): 2731
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: PAREN.UNBALANCED
- 内容: Unclosed bracket '（' in SP:idx-5/Article 5
- 証跡: offset 711 in article text
- 検証状態: **未確定 — 独立レビュー未実施**
### 17. [REF.ITEM.MISSING] MAIN/Article 71_2

- 法令: 所得税法施行令 (340CO0000000096)
- 行 (正規化テキスト): 596
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: REF.ITEM.MISSING
- 内容: Reference to item 3の一 but neither enclosing article 71_2 (items ['1', '2', '1', '2', '1', '2', '1', '2', '3', '1', '2', '3', '1', '2', '1', '2', '1', '2']) nor antecedent article 71_2 (items ['1', '2', '1', '2', '1', '2', '1', '2', '3', '1', '2', '3', '1', '2', '1', '2', '1', '2']) nor any earlier bound article contains it
- 証跡: sentence: イ第七項第二号イ又はロの残額当該満たない部分の金額の二分の一に相当する金額（ロに掲げる残額が当該二分の一に相当する金額に満たない場合には、当該満たない部分の金額を加算した金額）ロ第七項第三号の一般退職所得控除額を控除した残額当該満たない部分の金額の二分の一に相当する金額（イに掲げる残額が当該二分の一に相当する金額に満た
- 検証状態: **未確定 — 独立レビュー未実施**
### 18. [REF.ITEM.MISSING] MAIN/Article 71_2

- 法令: 所得税法施行令 (340CO0000000096)
- 行 (正規化テキスト): 596
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: REF.ITEM.MISSING
- 内容: Reference to item 3の一 but neither enclosing article 71_2 (items ['1', '2', '1', '2', '1', '2', '1', '2', '3', '1', '2', '3', '1', '2', '1', '2', '1', '2']) nor antecedent article 71_2 (items ['1', '2', '1', '2', '1', '2', '1', '2', '3', '1', '2', '3', '1', '2', '1', '2', '1', '2']) nor any earlier bound article contains it
- 証跡: sentence: イ第七項第一号の残額当該満たない部分の金額の二分の一に相当する金額（ロに掲げる残額が当該二分の一に相当する金額に満たない場合には、当該満たない部分の金額を加算した金額）ロ第七項第三号の一般退職所得控除額を控除した残額当該満たない部分の金額の二分の一に相当する金額（イに掲げる残額が当該二分の一に相当する金額に満たない場合
- 検証状態: **未確定 — 独立レビュー未実施**
### 19. [REF.ITEM.MISSING] MAIN/Article 71_2

- 法令: 所得税法施行令 (340CO0000000096)
- 行 (正規化テキスト): 596
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: REF.ITEM.MISSING
- 内容: Reference to item 3の一 but neither enclosing article 71_2 (items ['1', '2', '1', '2', '1', '2', '1', '2', '3', '1', '2', '3', '1', '2', '1', '2', '1', '2']) nor antecedent article 71_2 (items ['1', '2', '1', '2', '1', '2', '1', '2', '3', '1', '2', '3', '1', '2', '1', '2', '1', '2']) nor any earlier bound article contains it
- 証跡: sentence: イ第七項第一号の残額当該満たない部分の金額の二分の一に相当する金額（ロに掲げる残額が当該二分の一に相当する金額に満たない場合には、当該満たない部分の金額を加算した金額）ロ第七項第三号の一般退職所得控除額を控除した残額当該満たない部分の金額の二分の一に相当する金額（イに掲げる残額が当該二分の一に相当する金額に満たない場合
- 検証状態: **未確定 — 独立レビュー未実施**
### 20. [REF.PARA.MISSING] MAIN/Article 119_4

- 法令: 所得税法施行令 (340CO0000000096)
- 行 (正規化テキスト): 974
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: REF.PARA.MISSING
- 内容: Reference to paragraph 3 but neither enclosing article 119_4 (paragraphs [1, 2]) nor antecedent article 119_4 (paragraphs [1, 2]) contains it
- 証跡: sentence: この場合において、同条第三項中「事業所得の金額」とあるのは、「事業所得の金額又は雑所得の金額」と読み替えるものとする。
- 検証状態: **未確定 — 独立レビュー未実施**
### 21. [REF.ARTICLE.DELETED] SP:idx-69/Article 5

- 法令: 所得税法施行令 (340CO0000000096)
- 行 (正規化テキスト): 3086
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: REF.ARTICLE.DELETED
- 内容: Reference to deleted article 第五十五条 in 340AC0000000033
- 証跡: sentence: 昭和五十六年十二月三十一日において特別修繕引当金勘定の金額（所得税法第五十五条第二項（特別修繕引当金）に規定する特別修繕引当金勘定の金額をいう。以下この条において同じ。）を有する個人は、当該特別修繕引当金勘定の金額が次の各号に掲げる場合の区分に応じ当該各号に定める金額（以下この項において「累積限度額」という。）を超える
- 検証状態: **未確定 — 独立レビュー未実施**
### 22. [REF.PARA.MISSING] SP:idx-69/Article 5

- 法令: 所得税法施行令 (340CO0000000096)
- 行 (正規化テキスト): 3086
- 重要度: candidate
- 分類: legal-defect-candidate
- 検出規則: REF.PARA.MISSING
- 内容: Reference to paragraph 2 but 340AC0000000033 article 五十五 has paragraphs [1]
- 証跡: sentence: 昭和五十六年十二月三十一日において特別修繕引当金勘定の金額（所得税法第五十五条第二項（特別修繕引当金）に規定する特別修繕引当金勘定の金額をいう。以下この条において同じ。）を有する個人は、当該特別修繕引当金勘定の金額が次の各号に掲げる場合の区分に応じ当該各号に定める金額（以下この項において「累積限度額」という。）を超える
- 検証状態: **未確定 — 独立レビュー未実施**

## 6. 未対応範囲 (明示)
- 別表の内容意味検査 (tables) は未対応。
- 条文間の意味的矛盾検査 (意味検証) は Lean モデル (JapanTaxLaw/ResidencySpec) 側で限定的に実施。
- 参照のうち**他律** (例: 法人税法第○条) は一括として未検証 (unverified)。
- 参照のうち、改正経過規定中の「附則第○条」参照は `refugee_external` として扱い未検証。
- 非永住者 (Act art. 2(1)(iv)) は R1 の対象外。
- 法令の欠陥確定には法的専門家による独立レビューが必要であり、本レポートはその代替ではない。

## 7. モデルの欠陥と法律の欠陥の区別
| 現象 | 帰属 |
|---|---|
| Lean モデルが意図通りに動かない | モデル欠陥 (実装側の修正対象) |
| 参照先が他律で未検証 | 未対応範囲 (ツールの制約) |
| 条文間の意味的矛盾が検出された | 候補 (検討対象; 確定は独立レビュー後) |
| 原文ハッシュ不一致 | ソース版不一致 (データ修正対象) |
