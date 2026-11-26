# UNIT — LocalTaxBracket1800To4000（地方税法 art.37の2 1800万超4000万以下）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- 原文「千八百万円を超え四千万円以下の金額」
- 実装/独立仕様/境界: `LocalTaxBracket1800To4000{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle155-local-brackets3.md`
- 範囲: 円単位の区間判定 `(18,000,000, 40,000,000]` のみ。
