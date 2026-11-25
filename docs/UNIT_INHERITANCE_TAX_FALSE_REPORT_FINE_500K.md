# UNIT — InheritanceTaxFalseReportFineCap500k（相続税法 art.70 罰金上限50万円）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000073` / rev `325AC0000000073_20260401_506AC0000000008`
- norm unit `NORM|7b425573f95498e3b8d...` `.../Article:70/.../Sentence#1`
- 原文「…一年以下の拘禁刑又は五十万円以下の罰金に処する。」
- 実装/独立仕様/境界: `InheritanceTaxFalseReportFineCap500k{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle124-filing-fines.md`
- 範囲: 罰金額の上限判定のみ。調書提出義務・虚偽記載の認定は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
