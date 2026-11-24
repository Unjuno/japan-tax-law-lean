# UNIT — BusinessTaxCollectionCostRate5（地方税法施行規則 art.24の28 5%）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `329M50000002023` / rev `329M50000002023_20261101_508M60000008045`
- norm unit `NORM|5f02fed15028cf0b6064a...` `.../Article:24_28/.../Sentence#1`
- 原文「…事業所税の徴収に要する費用は、当該年度の歳入に所属する事業所税の額の百分の五に相当する額とする。」
- 実装/独立仕様/境界: `BusinessTaxCollectionCostRate5{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle118-delegated-rates.md`
- 範囲: 所与の税額への 5/100 の適用のみ。歳入算定・実際支出・端数は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
