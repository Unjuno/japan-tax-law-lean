# UNIT — SakeNonBrewingPeriod3Y（酒税法 art.12 酒類製造休止3年以上）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `328AC0000000006` / rev `328AC0000000006_20260525_506AC0000000052`
- 原文「三年以上引き続き酒類を製造しない場合」
- 実装/独立仕様/境界: `SakeNonBrewingPeriod3Y{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle169-period-cell.md`
- 範囲: `years >= 3` の境界判定のみ。継続性の判定は未対応。
