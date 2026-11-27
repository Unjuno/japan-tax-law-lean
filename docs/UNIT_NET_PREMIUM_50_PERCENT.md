# UNIT — NetPremium50Percent（租税特別措置法施行令 art.33の3 50%算定）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`
- 原文「…正味収入保険料の百分の五十に相当する金額」
- 実装/独立仕様/境界: `NetPremium50Percent{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle165-percent-amounts2.md`
- 範囲: `base*50/100` の切り捨て算定のみ。保険料算定は未対応。
