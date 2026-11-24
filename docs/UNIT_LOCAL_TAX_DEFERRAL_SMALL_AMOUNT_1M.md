# UNIT — LocalTaxDeferralSmallAmountException1M（地方税法 art.55の2 100万円）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- norm unit `NORM|8c095d47899bc578623...` `.../Article:55_2/.../Sentence#1`
- 原文「ただし、その猶予に係る税額が百万円以下である場合…この限りでない。」
- 実装/独立仕様/境界: `LocalTaxDeferralSmallAmountException1M{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle123-amount-ceilings.md`
- 範囲: 100万円の金額要件のみ。期間・担保・手続は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
