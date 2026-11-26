# UNIT — RndExcess3To15（租税特別措置法 art.10 3%超〜15%以下）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`
- norm unit `NORM|0d9cd80cd3496979b0de1dd76ec0...` `.../Article:10/...` EXCEPTION
- 原文「増減試験研究費割合が百分の三を超え百分の十五以下である場合（ニに掲げる場合を除く。）」
- 実装/独立仕様/境界: `RndExcess3To15{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle132-rnd-intervals.md`
- 範囲: 100分率の区間判定 `3 < rate <= 15` のみ。例外・割合の算定は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
