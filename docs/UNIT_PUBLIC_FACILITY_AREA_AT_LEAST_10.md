# UNIT — PublicFacilityAreaAtLeast10（租税特別措置法施行令 art.43の2 10%以上）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`
- norm unit `NORM|6f4f0655fc97961e62acd3b8...` `.../Article:43_2/...` CONDITION
- 原文「公共施設面積割合が百分の十以上であること。」
- 実装/独立仕様/境界: `PublicFacilityAreaAtLeast10{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle144-enforcement-ranges.md`
- 範囲: `rate >= 10` の境界判定のみ。面積算定・適用先は未対応。
