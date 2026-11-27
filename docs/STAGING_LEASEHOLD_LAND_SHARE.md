# STAGING: LeaseholdLandShare

- Normative id: NORM|37eab91bc7fd7bf723a2a42832bba7a8e61717b8deeaa709164fe08e767bc8c6
- Law: 403AC0000000069, revision 403AC0000000069_20250601_504AC0000000068, art. 18(1)
- Clause: 借地権等が設定されている場合において、当該土地等が借地権等以外のもの（以下この号において「底地」という。）であるとき。　三万円に当該底地の価額が更地の価額のうちに占める割合を乗じて計算した金額
- Model: ¥30000 multiplied by provider base/whole land-value ratio, zero-guarded.
- Implementation: `JapanTaxLaw/LeaseholdLandShare.lean`.
- Independent spec: `JapanTaxLaw/LeaseholdLandShareSpec.lean`.
- Tests: `JapanTaxLaw/LeaseholdLandShareTests.lean` (six kernel-decided examples).
- Review: `docs/adversarial/reviews-leasehold-land-share.md`.
- NOT MODELLED: leasehold recognition, land valuation, rounding details.
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
