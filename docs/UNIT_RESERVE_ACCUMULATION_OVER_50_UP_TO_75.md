# UNIT — ReserveAccumulationOver50UpTo75（租税特別措置法施行令 art.33の3 50-75%）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`
- norm unit `NORM|26ae3aab...` は既に他作業で FULLY_VERIFIED; 本セルは
  `NORM|...` の 50%超75%以下区分（同一原文テキストの別区分）を対象とする。
- 原文「異常危険準備金累積割合が百分の五十を超え百分の七十五以下の場合」
- 実装/独立仕様/境界: `ReserveAccumulationOver50UpTo75{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle144-enforcement-ranges.md`
- 範囲: `(50%,75%]` の区間判定のみ。
