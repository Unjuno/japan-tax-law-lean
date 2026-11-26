# UNIT — CityPlanningTaxRateCeiling03（地方税法 art.702の4 0.3%上限）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- 原文「都市計画税の税率は、百分の〇・三を超えることができない。」
- 実装/独立仕様/境界: `CityPlanningTaxRateCeiling03{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle152-local-tax-brackets.md`
- 範囲: 1000分率の上限判定 `rate <= 3` のみ。
