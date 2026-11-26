# UNIT — LocalTaxBracket695To900（地方税法 art.37の2 695万超900万以下）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- 原文「六百九十五万円を超え九百万円以下の金額」
- 実装/独立仕様/境界: `LocalTaxBracket695To900{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle154-local-brackets2.md`
- 範囲: 円単位の区間判定 `(6,950,000, 9,000,000]` のみ。
