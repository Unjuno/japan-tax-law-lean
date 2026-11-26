# UNIT — ExtraDepreciationBelow10（所得税法施行令 art.133 10%未満）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `340CO0000000096` / rev `340CO0000000096_20260522_508CO0000000093`
- norm unit `NORM|f4e8505784f0b98713669...` `.../Article:133/...` EXCEPTION
- 原文「ただし、当該増加償却割合が百分の十に満たない場合は、この限りでない。」
- 実装/独立仕様/境界: `ExtraDepreciationBelow10{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle142-enforcement-ratios.md`
- 範囲: `rate < 10` の境界判定のみ。割合算定・適用除外全体は未対応。
