# UNIT — InheritedAnnuityRatioAtMost50（所得税法施行令 art.185 確定年金50%以下）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `340CO0000000096` / rev `340CO0000000096_20260522_508CO0000000093`
- norm unit `NORM|6b1e8c86cae2b21a373...` `.../Article:185/...` CONDITION
- 原文「相続税評価割合が百分の五十以下の確定年金」
- 実装/独立仕様/境界: `InheritedAnnuityRatioAtMost50{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle143-annuity-ranges.md`
- 範囲: `rate <= 50` の境界判定のみ。年金算定・課税関係は未対応。
