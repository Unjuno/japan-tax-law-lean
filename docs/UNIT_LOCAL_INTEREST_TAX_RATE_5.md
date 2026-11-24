# UNIT — LocalInterestTaxRate5（地方税法 art.71の6 利子割 5%）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law_id `325AC0000000226` / revision `325AC0000000226_20261101_508AC0000000002`
- source `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`
- norm unit: `NORM|7e5f5d2a586ff79c2ee3e...` `.../Article:71_6/Paragraph#1/ParagraphSentence/Sentence#1`
- 原文: 「利子割の税率は、百分の五とする。」
- 実装 / 独立仕様 / 境界: `LocalInterestTaxRate5{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle114-shares.md`

## 範囲
所与の課税標準への 5/100 の適用のみ。利子等の定義・課税標準・申告・徴収・端数は未対応。
条文全体の形式化を主張しない。H/T/D/C/U は独立レビュー文件に記録済み。
