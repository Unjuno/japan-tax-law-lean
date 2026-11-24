# UNIT — SpecialMeasuresOwnershipThreshold50（租税特別措置法施行令 art.19の3 50%超）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`
- norm unit `NORM|5c822e0dabc6daf97eeb6...` `.../Article:19_3/.../Sentence#1`
- 原文「発行済株式等の総数又は総額の百分の五十を超える数又は金額の株式が当該株式会社により所有されている場合」
- 実装/独立仕様/境界: `SpecialMeasuresOwnershipThreshold50{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle120-ownership50.md`
- 範囲: 所与の100分率の「50 超」判定のみ。株主等の定義・割合算定・適用効果は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
