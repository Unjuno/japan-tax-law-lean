# UNIT — LocalGrantTaxShares（地方交付税法 art.6の2 §2/§3）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law_id: `325AC0000000211`
- revision: `325AC0000000211_20261102_508AC0000000062`
- source: `data/raw/325AC0000000211_20261102_508AC0000000062.law.json`
- 対象 norm unit（原文のセル座標で固定）:
  - `NORM|2485fde4475c83b98f617ad1f2d8f6543e766e59e6695c54c9cf94f7e1cc48c2`
    `.../Article:6_2/Paragraph#2/ParagraphSentence/Sentence#1`（百分の九十四）
  - `NORM|42a400a6f2fc66d481c1239fe7f0db5146141301c8e417d2b9d51cf659ce5c03`
    `.../Article:6_2/Paragraph#3/ParagraphSentence/Sentence#1`（百分の六）
- 原文逐語: 「前条第二項の額の百分の九十四に相当する額」 / 「前条第二項の額の百分の六に相当する額」
- 独立仕様: `JapanTaxLaw/LocalGrantTaxSharesSpec.lean`（実装定数名を参照しない）
- 実装: `JapanTaxLaw/LocalGrantTaxShares.lean`
- 境界: `JapanTaxLaw/LocalGrantTaxSharesTests.lean`（0 / 小入力 / 93,94,95 / 99,100,101 / 非100倍数）
- 独立レビュー: `docs/adversarial/reviews-cycle114-shares.md`

## 対象範囲（一部の計算可能な規則のみ）

対象は所与の `total`（前条第二項の額）に対する 94/100 と 6/100 の割合適用のみ。
`total` の算定、端数処理、附則の特例、臨時財政対策債、配分手続は **未対応**。
本ユニットは条文全体の形式化を主張しない。

## H/T/D/C/U

- H: 94% と 6% の取り違え、または別項の数値流用。
- T: 二つの項を独立再抽出し、Spec 分子と原文を照合。
- D: BY-DESIGN / CONFIRMED 0（技術的照合のみ）。
- C: 「前条第二項の額の算定まで含む」との誤読があり得るが、範囲は割合適用に限定。
- U: 端的上面・附則・算定基礎は未対応。法的レビューは未実施。
