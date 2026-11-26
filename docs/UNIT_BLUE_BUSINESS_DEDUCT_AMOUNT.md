# UNIT — BlueBusinessDeductAmount（所得税法 art.3 青色事業専従者控除額）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `340AC0000000033` / rev `340AC0000000033_20261001_507AC0000000070`
- norm unit `NORM|dba821f7cecd1a2bb81a...` `.../Article:3/...` CONDITION
- 原文「二十二万五千円（年齢が二十歳未満の場合には、二十一万七千五百円）」
- 実装/独立仕様/境界: `BlueBusinessDeductAmount{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle141-cross-law.md`
- 範囲: 金額の選択のみ。専従者要件・所得計算は未対応。
