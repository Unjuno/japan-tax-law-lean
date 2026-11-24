# UNIT — LocalCorporateDeductionLimitRate6（地方税法施行令 art.48の13 6%）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325CO0000000245` / rev `325CO0000000245_20261101_508CO0000000083`
- source `data/raw/325CO0000000245_20261101_508CO0000000083.law.json`
- norm unit `NORM|767c87c8d99c1b4884884...` `.../Article:48_13/.../Sentence#1`
- 原文「法人税の控除限度額に百分の六を乗じて計算した額とする。」
- 実装/独立仕様/境界: `LocalCorporateDeductionLimitRate6{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle115-rates.md`
- 範囲: 所与の控除限度額への 6/100 の乗算のみ。限度額そのものの算定・端数は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
