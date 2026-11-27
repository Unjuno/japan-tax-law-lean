# UNIT — ForestRateAtLeast85（森林環境税施行規則 art.1の3 85%以上）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `431M60000008040` / rev `431M60000008040_20261021_508M60000008119`
- norm unit `NORM|1edc20dabe30e0470813...` `.../Article:1_3/...` CONDITION
- 原文「林野率が百分の八十五以上であるもの」
- 実装/独立仕様/境界: `ForestRateAtLeast85{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle148-consumption-forest.md`
- 範囲: `rate >= 85` の境界判定のみ。林野率の算定・自治体認定は未対応。
