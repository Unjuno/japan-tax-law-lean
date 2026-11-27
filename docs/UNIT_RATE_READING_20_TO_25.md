# UNIT — RateReading20To25（租税特別措置法 art.37の3 20→25）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`
- norm unit `NORM|5de000c56114db06f52d1...` `.../Article:37_3/...` EFFECT
- 原文「第一項各号中「百分の二十」とあるのは、「百分の二十五」とする。」
- 実装/独立仕様/境界: `RateReading20To25{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle147-rate-readings.md`
- 範囲: 20→25 の置換写像のみ。第一項各号の特定は未対応。
