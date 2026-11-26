# UNIT — RndExcessOver12（租税特別措置法 art.10 12%超）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`
- norm unit `NORM|42dde91d8d3ec844eff48d83130dc8...` `.../Article:10/...` EXCEPTION
- 原文「増減試験研究費割合が百分の十二を超える場合（ニに掲げる場合を除く。）」
- 実装/独立仕様/境界: `RndExcessOver12{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle131-rnd-thresholds.md`
- 範囲: 100分率の境界判定 `rate > 12` のみ。「ニに掲げる場合」の例外・割合の算定は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
