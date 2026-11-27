# UNIT — RateReading20To10（租税特別措置法 art.37の3 20→10）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`
- norm unit `NORM|e244aa8884ce6f799e038...` `.../Article:37_3/...` EFFECT
- 原文「第一項各号中「百分の二十」とあるのは、「百分の十」とする。」
- 実装/独立仕様/境界: `RateReading20To10{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle147-rate-readings.md`
- 範囲: 20→10 の置換写像のみ。第一項各号の特定は未対応。
