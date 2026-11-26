# UNIT — ContinuingIncreaseAtLeast5（租税特別措置法 art.10の5の4 5%以上）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`
- norm unit `NORM|af60a97f60a71e66c640...` `.../Article:10_5_4/...` CONDITION
- 原文「継続雇用者給与等支給増加割合が百分の五以上であること」
- 実装/独立仕様/境界: `ContinuingIncreaseAtLeast5{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle135-salary-increase.md`
- 範囲: `rate >= 5` の境界判定のみ。割合算定・適用範囲は未対応。H/T/D/C/U はレビュー文件に記録済み。
