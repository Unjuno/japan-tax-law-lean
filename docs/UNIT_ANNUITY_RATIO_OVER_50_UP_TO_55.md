# UNIT — AnnuityRatioOver50UpTo55（所得税法施行令 art.185 50%超55%以下）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `340CO0000000096` / rev `340CO0000000096_20260522_508CO0000000093`
- norm unit `NORM|f6ead0989f635a237081...` `.../Article:185/...` CONDITION
- 原文「相続税評価割合が百分の五十を超え百分の五十五以下の場合」
- 実装/独立仕様/境界: `AnnuityRatioOver50UpTo55{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle143-annuity-ranges.md`
- 範囲: `(50%, 55%]` の区間判定のみ。年金算定・課税関係は未対応。
