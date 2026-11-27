# UNIT — TransferPriceAtMost120（租税特別措置法施行令 art.25の18の3 120%以下）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`
- 原文「…対価の額に百分の百二十を乗じて計算した金額を超えない場合」
- 実装/独立仕様/境界: `TransferPriceAtMost120{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle158-transfer-price.md`
- 範囲: `price <= base*120/100` の判定のみ。
