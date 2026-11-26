# UNIT — ReserveAccumulationAtMost25（租税特別措置法施行令 art.33の3 25%以下）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`
- norm unit `NORM|c330627525152420ff1a8...` `.../Article:33_3/...` CONDITION
- 原文「異常危険準備金累積割合が百分の二十五以下の場合」
- 実装/独立仕様/境界: `ReserveAccumulationAtMost25{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle141-cross-law.md`
- 範囲: `rate <= 25` の境界判定のみ。割合算定・適用先は未対応。
