# UNIT — PerMilleSevenPointFive（租税特別措置法施行令 art.11 千分の七・五）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`
- 原文「同条第四項第三号中『百分の一』とあるのは、『千分の七・五』とする。」
- 実装/独立仕様/境界: `PerMilleSevenPointFive{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle171-deduction-permille.md`
- 範囲: `base*75/10000` の切り捨て算定のみ。読み替えの適用対象は未対応。
