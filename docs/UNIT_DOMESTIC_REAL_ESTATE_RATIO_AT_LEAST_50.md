# UNIT — DomesticRealEstateRatioAtLeast50（相互主義非課税法施行令 art.7 50%以上）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `337CO0000000227` / rev `337CO0000000227_20260401_508CO0000000083`
- 原文「国内不動産の価額の合計額の占める割合が百分の五十以上である法人の株式」
- 実装/独立仕様/境界: `DomesticRealEstateRatioAtLeast50{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle157-open-space-and-real-estate.md`
- 範囲: `rate >= 50` の境界判定のみ。資産価額の算定・法人認定は未対応。
