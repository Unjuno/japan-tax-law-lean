# UNIT — OfficeFeeSpecialWardAmount（地方税法 art.734 特別区内外による額）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- 原文「百七十五万円（事務所等が特別区の区域外にも所在する場合以外の場合には、二百二十九万円）」
- 実装/独立仕様/境界: `OfficeFeeSpecialWardAmount{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle170-fee-amounts.md`
- 範囲: 二つの額の分岐のみ。事務所の所在判定・算定は未対応。
