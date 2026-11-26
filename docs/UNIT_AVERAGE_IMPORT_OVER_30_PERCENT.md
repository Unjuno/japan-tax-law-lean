# UNIT — AverageImportOver30Percent（関税暫定措置法 art.7の3 30%超）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `335AC0000000036` / rev `335AC0000000036_20260401_508AC0000000005`
- norm unit `NORM|4ac298be5ef443f3b264...` `.../Article:7_3/...` CONDITION
- 原文「平均輸入数量が平均国内消費量に百分の三十を乗じて得た数量を超える場合」
- 実装/独立仕様/境界: `AverageImportOver30Percent{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle145-tariff-quantity.md`
- 範囲: `i > c*30/100` の判定のみ。平均数量の算定は未対応。
