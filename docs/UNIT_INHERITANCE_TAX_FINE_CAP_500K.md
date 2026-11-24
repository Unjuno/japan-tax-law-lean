# UNIT — InheritanceTaxLateFilingFineCap500k（相続税法 art.69 罰金上限50万円）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000073` / rev `325AC0000000073_20260401_506AC0000000008`
- norm unit `NORM|fc6d15c660ee7d08d6f...` `.../Article:69/.../Sentence#1`
- 原文「…一年以下の拘禁刑又は五十万円以下の罰金に処する。」
- 実装/独立仕様/境界: `InheritanceTaxLateFilingFineCap500k{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle123-amount-ceilings.md`
- 範囲: 罰金額の上限判定のみ。拘禁刑・构成要件・科刑手続は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
