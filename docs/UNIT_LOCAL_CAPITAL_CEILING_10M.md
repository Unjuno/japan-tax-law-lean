# UNIT — LocalCapitalCeiling10M（地方税法 art.52 ホ 資本金1000万円以下）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- norm unit `NORM|018f9cb69c1cc3f231a...` `.../Article:52/.../Sentence#1`
- 原文「…資本金等の額が千万円以下であるもの」
- 実装/独立仕様/境界: `LocalCapitalCeiling10M{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle125-local-ceilings.md`
- 範囲: 資本金等の額の上限判定のみ。法人区分・課税標準・税額計算は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
