# UNIT — MotorVehicleTaxShortfallSurcharge35（地方税法 art.12の5 35%）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- norm unit `NORM|67f7fe9fc62e12e734348...` `.../Article:12_5/.../Sentence#1`
- 原文「同項の不足額に、これに百分の三十五の割合を乗じて計算した金額を加算した金額とする。」
- 実装/独立仕様/境界: `MotorVehicleTaxShortfallSurcharge35{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle117-shortfall.md`
- 範囲: 不足額への 35/100 の加算のみ。不足額の算定・合計税額・端数は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
