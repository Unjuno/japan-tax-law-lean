# UNIT — DisabilityDeductionTiers（地方税法 art.37 障害者控除の二段階額）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- 原文「当該障害者一人につき一万円」／「当該特別障害者一人につき十万円」
- 実装/独立仕様/境界: `DisabilityDeductionTiers{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle171-deduction-permille.md`
- 範囲: 一人あたり額の二段階分岐と人数乗算のみ。認定・人数算定は未対応。
