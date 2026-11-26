# UNIT — CombinedRndExcessAtMost3（租税特別措置法 art.42の4 合算3%以下）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`
- norm unit `NORM|8f67561ca619819ff350e...` `.../Article:42_4/...` EXCEPTION
- 原文「合算増減試験研究費割合が百分の三以下である場合（（３）に掲げる場合を除く。）」
- 実装/独立仕様/境界: `CombinedRndExcessAtMost3{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle137-combined-rnd.md`
- 範囲: `rate <= 3` の境界判定のみ。（３）の例外・合算割算定は未対応。H/T/D/C/U はレビュー文件に記録済み。
