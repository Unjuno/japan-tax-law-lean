# STAGING: DelinquencyCostNet

- Normative id: NORM|430e94d648017dcbea837b0f4a3edd6e3c20e5d00a1451c39d898a61bbb9cc61
- Law: 329CO0000000051, revision 329CO0000000051_20260401_508CO0000000085, art. 22(1)
- Clause: 滞納処分費の収納済額及び滞納処分費に係る返納金（過誤納金の還付金等に係るものに限る。）の収納済額の合計額から滞納処分費に係る支払決定済額を控除した金額は、一般会計の雑収入とする。
- Model: saturating residual of collected + refund receipts minus paid amount.
- Implementation: `JapanTaxLaw/DelinquencyCostNet.lean`.
- Independent spec: `JapanTaxLaw/DelinquencyCostNetSpec.lean`.
- Tests: `JapanTaxLaw/DelinquencyCostNetTests.lean` (six kernel-decided examples).
- Review: `docs/adversarial/reviews-delinquency-cost-net.md`.
- NOT MODELLED: refund recognition, general-account bookkeeping.
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
