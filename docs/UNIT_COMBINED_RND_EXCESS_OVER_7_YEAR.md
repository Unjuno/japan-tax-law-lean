# UNIT — CombinedRndExcessOver7Year（租税特別措置法 art.42の4 7%超の事業年度）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`
- norm unit `NORM|c7a4b079992374e2db09...` `.../Article:42_4/...` CONDITION
- 原文「増減試験研究費割合が百分の七を超える事業年度」
- 実装/独立仕様/境界: `CombinedRndExcessOver7Year{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle138-combined-year.md`
- 範囲: `rate > 7` のみ。割合算定・年度特定は未対応。H/T/D/C/U はレビュー文件に記録済み。
