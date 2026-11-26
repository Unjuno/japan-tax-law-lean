# UNIT — LoanBalanceRatioAtMost15（所得税法施行令 art.73 15%以下）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `340CO0000000096` / rev `340CO0000000096_20260522_508CO0000000093`
- norm unit `NORM|262bcc376c9f9694731ed...` `.../Article:73/...` CONDITION
- 原文「当該貸付金の残額の合計額の占める割合が常時百分の十五以下であること。」
- 実装/独立仕様/境界: `LoanBalanceRatioAtMost15{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle149-loan-and-foreign.md`
- 範囲: `rate <= 15` の境界判定のみ。
