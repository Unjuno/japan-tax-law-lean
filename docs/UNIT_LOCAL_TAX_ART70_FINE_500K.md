# UNIT — LocalTaxArt70FineCap500k（地方税法 art.70 罰金上限50万円）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- norm unit `NORM|f9680ddfb79eef94bb7...` `.../Article:70/.../Sentence#1`
- 原文「…一年以下の拘禁刑又は五十万円以下の罰金に処する。」
- 実装/独立仕様/境界: `LocalTaxArt70FineCap500k{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle128-fine-caps.md`
- 範囲: 罰金額の上限判定のみ。各号要件・拘禁刑・手続は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
