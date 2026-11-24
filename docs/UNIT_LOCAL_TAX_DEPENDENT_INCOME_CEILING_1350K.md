# UNIT — LocalTaxDependentIncomeCeiling1350k（地方税法 art.24の5 135万円）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- norm unit `NORM|ac3ff069691e4240620...` `.../Article:24_5/.../Sentence#1`
- 原文「…前年の合計所得金額が百三十五万円を超える場合を除く。」
- 実装/独立仕様/境界: `LocalTaxDependentIncomeCeiling1350k{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle122-amount-norms.md`
- 範囲: 合計所得金額の 135万円上限判定のみ。他の要件・所得算定・税額計算は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
