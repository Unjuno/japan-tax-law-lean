# UNIT — ResidualPeriod10To15（相続税法 art.23 残存期間10年超15年以下）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000073` / rev `325AC0000000073_20260401_506AC0000000008`
- 原文「残存期間が十年を超え十五年以下のもの」
- 実装/独立仕様/境界: `ResidualPeriod10To15{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle169-period-cell.md`
- 範囲: `10 < years <= 15` の境界判定のみ。残存期間の算定・適用は未対応。
