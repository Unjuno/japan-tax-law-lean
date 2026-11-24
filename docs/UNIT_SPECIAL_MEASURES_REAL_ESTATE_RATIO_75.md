# UNIT — SpecialMeasuresRealEstateRatio75（租税特別措置法 art.83の2の2 75%以上）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`
- norm unit `NORM|2ccc78a751feb8bb3f498...` `.../Article:83_2_2/.../Sentence#1`
- 原文「特定不動産の割合が百分の七十五以上であること。」
- 実装/独立仕様/境界: `SpecialMeasuresRealEstateRatio75{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle119-ratio-thresholds.md`
- 範囲: 所与の100分率の「75 以上」判定のみ。特定不動産の定義・割合算定・適用効果は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
