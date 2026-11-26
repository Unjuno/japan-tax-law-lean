# UNIT — SalaryIncreaseRate5Or15（租税特別措置法 art.10の5の4 5%／15%分岐）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`
- norm unit `NORM|2c836ae93c491ce758b8...` `.../Article:10_5_4/...` CONDITION
- 原文「百分の五（継続雇用者給与等支給増加割合が百分の六以上である場合には、百分の十五）」
- 実装/独立仕様/境界: `SalaryIncreaseRate5Or15{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle135-salary-increase.md`
- 範囲: 5%/15% 分岐の選択と境界判定のみ。割合算定・税額計算は未対応。H/T/D/C/U はレビュー文件に記録済み。
