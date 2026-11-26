# UNIT — EnergyEfficiency70Pct（租税特別措置法 art.90の12 70%以上）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`
- 原文「エネルギー消費効率が令和十二年度基準エネルギー消費効率に百分の七十を乗じて得た数値以上であること。」
- 実装/独立仕様/境界: `EnergyEfficiency70Pct{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle151-energy-efficiency.md`
- 範囲: `eff >= base*70/100` の判定のみ。基準効率の算定・認定は未対応。
