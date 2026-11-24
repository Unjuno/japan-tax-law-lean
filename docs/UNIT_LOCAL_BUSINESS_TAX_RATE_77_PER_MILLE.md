# UNIT — LocalBusinessTaxRate77PerMille（地方税法施行令 art.35の4の7 7.7%）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325CO0000000245` / rev `325CO0000000245_20261101_508CO0000000083`
- norm unit `NORM|c12925c2b8b45d3390a18...` `.../Article:35_4_7/...`
- 原文「…の百分の七・七に相当する額」
- 実装/独立仕様/境界: `LocalBusinessTaxRate77PerMille{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle121-business-tax-rate.md`
- 範囲: 所与の額への 77/1000 の適用のみ。事業税額・各号・端数は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
