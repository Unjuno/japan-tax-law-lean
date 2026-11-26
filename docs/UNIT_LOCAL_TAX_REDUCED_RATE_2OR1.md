# UNIT — LocalTaxReducedRate2or1（地方税法 art.37 2%／指定都市1%）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- norm unit `NORM|2fdbb1d0d700b74e56be1...` `.../Article:37/.../Sentence#1`
- 原文「…少ない金額の百分の二（指定都市の区域内に住所を有する場合には、百分の一）」
- 実装/独立仕様/境界: `LocalTaxReducedRate2or1{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle129-rate-rules.md`
- 範囲: 所与の金額への 2%/1% 適用のみ。金額の算定・指定都市認定・端数は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
