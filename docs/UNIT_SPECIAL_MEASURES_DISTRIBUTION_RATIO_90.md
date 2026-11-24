# UNIT — SpecialMeasuresDistributionRatio90（租税特別措置法 art.68の3の3 90%超）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`
- norm unit `NORM|573bcf6e070045b318d92...` `.../Article:68_3_3/.../Sentence#1`
- 原文「…割合として政令で定める割合が百分の九十を超えていること。」
- 実装/独立仕様/境界: `SpecialMeasuresDistributionRatio90{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle119-ratio-thresholds.md`
- 範囲: 所与の100分率の「90 超」判定のみ。分配可能収益額・政令算定・適用効果は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
