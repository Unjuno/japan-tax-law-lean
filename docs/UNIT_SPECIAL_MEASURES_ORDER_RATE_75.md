# UNIT — SpecialMeasuresOrderRate75（租税特別措置法施行令 art.5の5 75%）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`
- norm unit `NORM|171af344885abf4e410ff...` `.../Article:5_5/.../Sentence#1`
- 原文「法第十条の三第一項に規定する政令で定める割合は、百分の七十五とする。」
- 実装/独立仕様/境界: `SpecialMeasuresOrderRate75{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle118-delegated-rates.md`
- 範囲: 所与の基礎金額への 75/100 の適用のみ。法第10条の3の要件・基礎金額・端数は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
