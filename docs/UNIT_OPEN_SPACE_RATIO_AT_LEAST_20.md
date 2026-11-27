# UNIT — OpenSpaceRatioAtLeast20（租税特別措置法施行令 art.22の8 20%以上）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`
- 原文「日常一般に開放された空地の部分の面積の割合が百分の二十以上であること。」
- 実装/独立仕様/境界: `OpenSpaceRatioAtLeast20{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle157-open-space-and-real-estate.md`
- 範囲: `rate >= 20` の境界判定のみ。面積算定・認定は未対応。
