# STAGING: PatentTransferRatio

- Normative id: NORM|4eac22eb12ef2a7a84f5379a5e149609fa458fcb98279c2c09fc0f7a9a53e4ed
- Law: 332M50000040015, revision 332M50000040015_20261101_507M60000040026, art. 21_17_2(2)
- Clause: 当該金額に取引数（当該特許権譲渡等取引及び当該特定特許権等に係る他の特許権譲渡等取引の数をいう。以下この号において同じ。）から一を控除した数が取引数のうちに占める割合を乗じて計算した金額
- Model: provider amount multiplied by (count-1)/count, guarded at zero count.
- Implementation: `JapanTaxLaw/PatentTransferRatio.lean`.
- Independent spec: `JapanTaxLaw/PatentTransferRatioSpec.lean`.
- Tests: `JapanTaxLaw/PatentTransferRatioTests.lean` (six kernel-decided examples).
- Review: `docs/adversarial/reviews-patent-transfer-ratio.md`.
- NOT MODELLED: transaction recognition, patent identification, amount computation, rounding details.
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
