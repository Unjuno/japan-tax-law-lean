# UNIT — RndExcess0To12（租税特別措置法 art.10 零以上12%以下）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`
- norm unit `NORM|ecce86cc84b7617a2c32460d...` `.../Article:10/...` EXCEPTION
- 原文「増減試験研究費割合が零以上であり百分の十二以下である場合（ニに掲げる場合を除く。）」
- 実装/独立仕様/境界: `RndExcess0To12{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle133-rnd-lower-bounds.md`
- 範囲: 100分率の区間判定 `0 <= rate <= 12` のみ。例外・割合の算定は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
