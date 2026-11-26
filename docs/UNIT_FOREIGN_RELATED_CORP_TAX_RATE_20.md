# UNIT — ForeignRelatedCorpTaxRate20（租税特別措置法 art.40の7 20%以上）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`
- norm unit `NORM|17040d29f714cb6fd2723...` `.../Article:40_7/...` CONDITION
- 原文「対象外国関係法人の各事業年度の租税負担割合が百分の二十以上である場合」
- 実装/独立仕様/境界: `ForeignRelatedCorpTaxRate20{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle149-loan-and-foreign.md`
- 範囲: `rate >= 20` の境界判定のみ。
