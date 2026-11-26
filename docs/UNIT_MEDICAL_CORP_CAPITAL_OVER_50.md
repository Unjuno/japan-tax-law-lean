# UNIT — MedicalCorpCapitalOver50（租税特別措置法施行令 art.40の8 50%超）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`
- norm unit `NORM|5f008831fc58132f8c78...` `.../Article:40_8/...` CONDITION
- 原文「当該医療法人の出資の総額の百分の五十を超える金額」
- 実装/独立仕様/境界: `MedicalCorpCapitalOver50{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle146-capital-and-floor.md`
- 範囲: `a > total*50/100` の判定のみ。出資額の算定は未対応。
