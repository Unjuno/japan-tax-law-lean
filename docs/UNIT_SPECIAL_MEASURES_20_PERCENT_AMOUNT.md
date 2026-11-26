# UNIT — SpecialMeasures20PercentAmount（租税特別措置法 art.42の14 20%相当額）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`
- 原文「同条第一項又は第二項に規定する百分の二十に相当する金額」
- 実装/独立仕様/境界: `SpecialMeasures20PercentAmount{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle167-special-measures-amount.md`
- 範囲: `base*20/100` の切り捨て算定のみ。根拠金額の算定・適用は未対応。
