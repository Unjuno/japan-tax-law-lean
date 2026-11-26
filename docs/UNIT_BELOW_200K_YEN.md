# UNIT — Below200kYen（所得税法施行令 art.182の2 20万円未満）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `340CO0000000096` / rev `340CO0000000096_20260522_508CO0000000093`
- norm unit `NORM|71d24e4ac95e8acc94eb1...` `.../Article:182_2/...` CONDITION
- 原文「二十万円未満である場合」
- 実装/独立仕様/境界: `Below200kYen{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle146-capital-and-floor.md`
- 範囲: `amount < 200000` の判定のみ。金額算定・適用先は未対応。
