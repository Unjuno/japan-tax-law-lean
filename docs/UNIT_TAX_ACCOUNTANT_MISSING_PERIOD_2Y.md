# UNIT — TaxAccountantMissingPeriod2Y（税理士法 art.25 所在不明2年以上）

- status: 技術的検証待ち（CI attestation 未 binding）; 法的レビュー: `LEGAL_REVIEW_PENDING`
- law `326AC1000000237` / rev `326AC1000000237_20251001_505AC0000000053`
- 原文「二年以上継続して所在が不明であるとき。」
- 実装/独立仕様/境界: `TaxAccountantMissingPeriod2Y{,Spec,Tests}.lean`
- 独立レビュー: `docs/adversarial/reviews-cycle168-period-thresholds.md`
- 範囲: `years >= 2` の境界判定のみ。継続性の判定は未対応。
