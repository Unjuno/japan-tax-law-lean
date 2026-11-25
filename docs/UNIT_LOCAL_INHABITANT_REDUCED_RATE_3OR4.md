# UNIT — LocalInhabitantReducedRate3or4（地方税法 art.314の6 3%／指定都市4%）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- norm unit `NORM|592c19cc7ceaeaa833d5e...` `.../Article:314_6/.../Sentence#1`
- 原文「…少ない金額の百分の三（指定都市の区域内に住所を有する場合には、百分の四）」
- 実装/独立仕様/境界: `LocalInhabitantReducedRate3or4{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle130-inhabitant-rate.md`
- 範囲: 所与の金額への 3%/4% 適用のみ。金額の算定・指定都市認定・端数は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
