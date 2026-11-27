# UNIT — FacilityCostAtLeast100M（地方税法施行令 art.16の2の8 施設取得価額1億円以上）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325CO0000000245` / rev `325CO0000000245_20261101_508CO0000000083`
- 原文「当該施設に係る建物及びその附属設備の取得価額の合計額が一億円以上であること。」
- 実装/独立仕様/境界: `FacilityCostAtLeast100M{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle174-thresholds.md`
- 範囲: `cost >= 100_000_000` の境界判定のみ。取得価額の算定は未対応。
