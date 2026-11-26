# UNIT — LocalTaxIncomeBracket4MTo1B（地方税法 art.9の2 四百万超十億以下）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- norm unit `NORM|85f4e8d8a317633f2b68...` `.../Article:9_2/...` CONDITION
- 原文「各事業年度の所得のうち年四百万円を超え年十億円以下の金額」
- 実装/独立仕様/境界: `LocalTaxIncomeBracket4MTo1B{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle139-local-brackets.md`
- 範囲: 円単位の区間判定 `(4,000,000, 1,000,000,000]` のみ。所得算定・適用先は未対応。
