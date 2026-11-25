# UNIT — InheritanceTaxEvasionFineCap10M（相続税法 art.68 罰金上限1000万円）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000073` / rev `325AC0000000073_20260401_506AC0000000008`
- norm unit `NORM|9c96df33df6ab42700e...` `.../Article:68/.../Sentence#1`
- 原文「…千万円以下の罰金に処し、又はこれを併科する。」
- 実装/独立仕様/境界: `InheritanceTaxEvasionFineCap10M{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle127-fine-and-deferral.md`
- 範囲: 罰金額の上限判定のみ。拘禁刑・不正行為・併科は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
