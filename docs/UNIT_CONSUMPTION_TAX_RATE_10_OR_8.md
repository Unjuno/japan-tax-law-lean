# UNIT — ConsumptionTaxRate10or8（消費税法 art.34 10%／8%）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `363AC0000000108` / rev `363AC0000000108_20261101_507AC0000000013`
- norm unit `NORM|08997b7f169d2f2fb221...` `.../Article:34/...` CONDITION
- 原文「百分の十（元年軽減対象資産の譲渡等である場合には、百分の八）」
- 実装/独立仕様/境界: `ConsumptionTaxRate10or8{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle148-consumption-forest.md`
- 範囲: 10%/8% の割合選択のみ。軽減対象の認定・課税標準は未対応。
