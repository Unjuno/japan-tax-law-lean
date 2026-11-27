# UNIT — LightOilNonHandlingPeriod1Y（地方税法施行令 art.43の8 1年以上）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325CO0000000245` / rev `325CO0000000245_20261101_508CO0000000083`
- 原文「一年以上引き続き軽油の製造、輸入又は販売をしていないこと。」
- 実装/独立仕様/境界: `LightOilNonHandlingPeriod1Y{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle168-period-thresholds.md`
- 範囲: `years >= 1` の境界判定のみ。継続性の判定は未対応。
