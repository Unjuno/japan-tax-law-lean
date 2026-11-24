# UNIT — PropertyAcquisitionSpecialRate3（地方税法 附則 art.11の2 3%）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- norm unit `NORM|22f8ca6dec6a1bb300024...` `.../SupplProvision.../Article:11_2/.../Sentence#1`
- 原文「…不動産取得税の標準税率は、第七十三条の十五の規定にかかわらず、百分の三とする。」
- 実装/独立仕様/境界: `PropertyAcquisitionSpecialRate3{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle116-ceiling-and-special.md`
- 範囲: 所与の課税標準への 3/100 の適用のみ。適用期間・物件認定・課税標準・端数は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
