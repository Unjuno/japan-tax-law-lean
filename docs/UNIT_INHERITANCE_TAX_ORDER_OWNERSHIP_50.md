# UNIT — InheritanceTaxOrderOwnership50Threshold（相続税法施行令 art.31 50%超）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325CO0000000071` / rev `325CO0000000071_20260401_506CO0000000143`
- norm unit `NORM|b338babb5647936d561...` `.../Article:31/.../Sentence#1`
- 原文「…発行済株式等の百分の五十を超える株式等が同項の個人等により所有されている場合」
- 実装/独立仕様/境界: `InheritanceTaxOrderOwnership50Threshold{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle126-order-rules.md`
- 範囲: 100分率の「50 超」判定のみ。株主法人の定義・所有割合算定は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
