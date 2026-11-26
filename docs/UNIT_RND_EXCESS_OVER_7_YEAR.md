# UNIT — RndExcessOver7Year（租税特別措置法 art.10 7%超の年分）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`
- norm unit `NORM|3e1811532469c91463a2...` `.../Article:10/...` CONDITION
- 原文「増減試験研究費割合が百分の七を超える年分」
- 実装/独立仕様/境界: `RndExcessOver7Year{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle134-rnd-year-thresholds.md`
- 範囲: `rate > 7` の境界判定のみ。割合算定・年分特定は未対応。H/T/D/C/U はレビュー文件に記録済み。
