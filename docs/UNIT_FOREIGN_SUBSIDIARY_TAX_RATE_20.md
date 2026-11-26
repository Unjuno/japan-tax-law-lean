# UNIT — ForeignSubsidiaryTaxRate20（租税特別措置法 art.40の4ほか 20%以上）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`
- norm unit `NORM|bd65dc1591b88a340bdd...` `.../Article:40_4/...` CONDITION
- 原文「対象外国関係会社の各事業年度の租税負担割合が百分の二十以上である場合」
- 実装/独立仕様/境界: `ForeignSubsidiaryTaxRate20{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle136-foreign-subsidiary.md`
- 範囲: `rate >= 20` の境界判定のみ。割合算定・会社認定は未対応。H/T/D/C/U はレビュー文件に記録済み。
