# UNIT — TriggerPriceGapOver75Percent（関税暫定措置法 art.7の4 75%超）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `335AC0000000036` / rev `335AC0000000036_20260401_508AC0000000005`
- norm unit `NORM|cea135942e206032d517...` `.../Article:7_4/...` CONDITION
- 原文「発動基準価格と課税価格との差額が発動基準価格に百分の七十五を乗じて得た金額を超える場合」
- 実装/独立仕様/境界: `TriggerPriceGapOver75Percent{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle145-tariff-quantity.md`
- 範囲: `gap > base*75/100` の判定のみ。価格算定・発動手続は未対応。
