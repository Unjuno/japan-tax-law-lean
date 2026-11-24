# UNIT — GiftTaxSettlementBasicDeduction600k（相続税法 art.21の11の2 60万円控除）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000073` / rev `325AC0000000073_20260401_506AC0000000008`
- norm unit `NORM|55e13519abd6d766aec...` `.../Article:21_11_2/.../Sentence#1`
- 原文「…贈与税の課税価格から六十万円を控除する。」
- 実装/独立仕様/境界: `GiftTaxSettlementBasicDeduction600k{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle122-amount-norms.md`
- 範囲: 課税価格からの 60万円控除のみ。適用要件・税額算定は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
