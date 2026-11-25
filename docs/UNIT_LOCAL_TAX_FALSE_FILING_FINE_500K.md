# UNIT — LocalTaxFalseFilingFineCap500k（地方税法 art.22の2 罰金上限50万円）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- norm unit `NORM|684f55ebed7b9926322...` `.../Article:22_2/.../Sentence#1`
- 原文「…一年以下の拘禁刑又は五十万円以下の罰金に処する。」
- 実装/独立仕様/境界: `LocalTaxFalseFilingFineCap500k{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle124-filing-fines.md`
- 範囲: 罰金額の上限判定のみ。拘禁刑・虚偽記載の認定・手続は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
