# UNIT — LocalSeparateIncomeTaxRate4（地方税法 art.50の4 分離課税所得割 4%）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`
- source `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`
- norm unit `NORM|e777c9f613185d2f9f336...` `.../Article:50_4/Paragraph#1/ParagraphSentence/Sentence#1`
- 原文「分離課税に係る所得割の税率は、百分の四とする。」
- 実装/独立仕様/境界: `LocalSeparateIncomeTaxRate4{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle115-rates.md`
- 範囲: 所与の課税標準への 4/100 の適用のみ。対象所得・課税標準の算定・端数は未対応。
  条文全体の形式化を主張しない。H/T/D/C/U はレビュー文件に記録済み。
