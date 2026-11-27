# UNIT — IncomeRegulationRate90（所得税法施行規則 art.90の2 90%）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `340M50000040011` / rev `340M50000040011_20261001_507M60000040018`
- 原文「…財務省令で定める割合は、百分の九十とする。」
- 実装/独立仕様/境界: `IncomeRegulationRate90{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle163-income-regulation-rate.md`
- 範囲: 割合 90% の定数モデルのみ。根拠条文の適用は未対応。
