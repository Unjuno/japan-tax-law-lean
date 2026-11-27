# UNIT — FixedAssetTaxBase5Percent（地方税法施行令 art.15 5%算定）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325CO0000000245` / rev `325CO0000000245_20261101_508CO0000000083`
- 原文「課税標準となるべき価格に、百分の五を乗じて得た額」
- 実装/独立仕様/境界: `FixedAssetTaxBase5Percent{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle159-percent-amounts.md`
- 範囲: `base*5/100` の切り捨て算定のみ。価格算定・年限は未対応。
