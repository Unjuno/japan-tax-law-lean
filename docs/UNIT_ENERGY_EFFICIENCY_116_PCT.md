# UNIT — EnergyEfficiency116Pct（租税特別措置法施行令 art.51の2 116%以上）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`
- 原文「…令和二年度基準エネルギー消費効率に百分の百十六を乗じて得た数値以上であること。」
- 実装/独立仕様/境界: `EnergyEfficiency116Pct{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle156-efficiency-105-116.md`
- 範囲: `eff >= base*116/100` の判定のみ。
