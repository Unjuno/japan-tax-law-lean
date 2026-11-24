# UNIT — LocalBusinessOwnershipThreshold50（地方税法施行規則 art.3の13の3 50%超）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `329M50000002023` / rev `329M50000002023_20261101_508M60000008045`
- norm unit `NORM|c5d9fe8f0dd97b8018bc9...` `.../Article:3_13_3/.../Sentence#1`
- 原文「発行済株式等の百分の五十を超える数又は金額の株式等が同項の一方の者により保有されている場合」
- 実装/独立仕様/境界: `LocalBusinessOwnershipThreshold50{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle120-ownership50.md`
- 範囲: 所与の100分率の「50 超」判定のみ。株主等の定義・割合算定・適用効果は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
