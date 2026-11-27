# UNIT — CustomsFee129000（税関関係手数料令 art.4 12.9万/12.8万）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `329CO0000000164` / rev `329CO0000000164_20250401_507CO0000000141`
- norm unit `NORM|f80124907737c4027eaee...` `.../Article:4/...` CONDITION
- 原文「十二万九千円（指定者である場合は、十二万八千円）」
- 実装/独立仕様/境界: `CustomsFee129000{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle150-customs-fees.md`
- 範囲: 二金額の選択のみ。許可要件・指定者認定は未対応。
