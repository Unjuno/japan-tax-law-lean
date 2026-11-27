# UNIT — LocalTaxBracket195To330（地方税法 art.37の2 195万超330万以下）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- 原文「百九十五万円を超え三百三十万円以下の金額」
- 実装/独立仕様/境界: `LocalTaxBracket195To330{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle152-local-tax-brackets.md`
- 範囲: 円単位の区間判定 `(1,950,000, 3,300,000]` のみ。
