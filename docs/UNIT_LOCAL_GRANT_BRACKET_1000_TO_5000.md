# UNIT — LocalGrantBracket1000To5000（地方税法 art.72の21 千億超五千億以下）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- norm unit `NORM|0683b64b0396c0ed4c03...` `.../Article:72_21/...` CONDITION
- 原文「千億円を超え五千億円以下の金額」
- 実装/独立仕様/境界: `LocalGrantBracket1000To5000{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle139-local-brackets.md`
- 範囲: 億円単位の区間判定 `(1000, 5000]` のみ。金額算定・適用先は未対応。
