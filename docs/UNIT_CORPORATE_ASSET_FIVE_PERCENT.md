# UNIT — CorporateAssetFivePercent（法人税法施行令 art.155の8 5%算定）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `340CO0000000097` / rev `340CO0000000097_20261001_507CO0000000121`
- 原文「…財務省令で定める金額の百分の五に相当する金額」
- 実装/独立仕様/境界: `CorporateAssetFivePercent{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle165-percent-amounts2.md`
- 範囲: `base*5/100` の切り捨て算定のみ。資産額の算定・認定は未対応。
