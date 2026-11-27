# UNIT — SpecialRndDeduction20Percent（租税特別措置法 art.10の2 20%算定）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`
- 原文「…政令で定める金額以外の金額の百分の二十に相当する金額」
- 実装/独立仕様/境界: `SpecialRndDeduction20Percent{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle159-percent-amounts.md`
- 範囲: `base*20/100` の切り捨て算定のみ。政令で定める金額は未対応。
