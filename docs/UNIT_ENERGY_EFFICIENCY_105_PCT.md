# UNIT — EnergyEfficiency105Pct（租税特別措置法 art.90の12 105%以上）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`
- 原文「…令和四年度基準エネルギー消費効率に百分の百五を乗じて得た数値以上であること。」
- 実装/独立仕様/境界: `EnergyEfficiency105Pct{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle156-efficiency-105-116.md`
- 範囲: `eff >= base*105/100` の判定のみ。
