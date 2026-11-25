# UNIT — LocalBusinessTaxOrderRate77PerMilleC（地方税法施行令 art.35の4の5 7.7%）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325CO0000000245` / rev `325CO0000000245_20261101_508CO0000000083`
- norm unit `NORM|828cfc73aaf9f4780a332...` `.../Article:35_4_5/.../Sentence#1`
- 原文「法第七十二条の七十六の政令で定める率は、百分の七・七とする。」
- 実装/独立仕様/境界: `LocalBusinessTaxOrderRate77PerMilleC{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle126-order-rules.md`
- 範囲: 所与の額への 77/1000 の適用のみ。法第72条の76の要件・端数は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
