# UNIT — PrivateFundRate20To15（租税特別措置法 art.8の2 20%→15%）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`
- 原文「…百分の二十の税率は、百分の十五の税率とする。」
- 実装/独立仕様/境界: `PrivateFundRate20To15{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle162-rate-substitution.md`
- 範囲: 20→15 の置換写像のみ。適用対象の認定は未対応。
