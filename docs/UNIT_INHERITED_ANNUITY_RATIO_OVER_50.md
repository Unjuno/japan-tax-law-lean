# UNIT — InheritedAnnuityRatioOver50（所得税法施行令 art.185 50%超）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `340CO0000000096` / rev `340CO0000000096_20260522_508CO0000000093`
- norm unit `NORM|6ca63f9ad464e72560376...` `.../Article:185/...` CONDITION
- 原文「相続税評価割合が百分の五十を超える確定年金」
- 実装/独立仕様/境界: `InheritedAnnuityRatioOver50{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle142-enforcement-ratios.md`
- 範囲: `rate > 50` の境界判定のみ。年金算定・課税関係は未対応。
