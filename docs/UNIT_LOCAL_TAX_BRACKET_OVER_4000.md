# UNIT — LocalTaxBracketOver4000（地方税法 art.37の2 4000万超）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- 原文「四千万円を超える金額」
- 実装/独立仕様/境界: `LocalTaxBracketOver4000{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle155-local-brackets3.md`
- 範囲: `yen > 40,000,000` の境界判定のみ。
