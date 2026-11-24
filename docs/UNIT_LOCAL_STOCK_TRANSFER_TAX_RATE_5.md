# UNIT — LocalStockTransferTaxRate5（地方税法 art.71の49 株式等譲渡所得割 5%）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law_id `325AC0000000226` / revision `325AC0000000226_20261101_508AC0000000002`
- source `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`
- norm unit: `NORM|8b4be4b68900d8794b81c...` `.../Article:71_49/Paragraph#1/ParagraphSentence/Sentence#1`
- 原文: 「株式等譲渡所得割の税率は、百分の五とする。」
- 実装 / 独立仕様 / 境界: `LocalStockTransferTaxRate5{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle114-shares.md`

## 範囲
所与の課税標準への 5/100 の適用のみ。株式等の定義・所得金額算定・軽減税率・端数は未対応。
条文全体の形式化を主張しない。H/T/D/C/U は独立レビュー文件に記録済み。
