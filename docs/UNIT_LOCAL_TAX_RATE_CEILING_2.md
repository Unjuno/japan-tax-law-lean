# UNIT — LocalTaxRateCeiling2Percent（地方税法 art.51 2% 上限）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- norm unit `NORM|c6450946afa36af4ed52b...` `.../Article:51/Paragraph#1/ParagraphSentence/Sentence#2`
- 原文「標準税率を超える税率で課する場合においても、百分の二を超えることができない。」
- 実装/独立仕様/境界: `LocalTaxRateCeiling2Percent{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle116-ceiling-and-special.md`
- 範囲: 100分率の上限判定のみ。標準税率・課税標準・税率決定・端数は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
