# STAGING: ExcessFinanceGrant75Cap

- Normative id: NORM|329dfc7dbb7c019197e3e433ac1da86b5e41b6ce06202825fa1a54e2bd838e0a
- Law: 431AC0000000004, revision 431AC0000000004_20260401_508AC0000000002, art. 31(5)(4)
- Clause: 財源超過団体における十一月の譲与時期に係る基準各譲与時期特別法人事業譲与税額の百分の七十五に相当する額（当該額に当該財源超過団体に係る五月分財源超過団体譲与制限額及び八月分財源超過団体譲与制限額の合算額を加えた額が財源超過額を超える場合には、当該財源超過額から当該合算額を控除した額とする。）をいう。
- Model: 75/100 of a provider base grant, capped by provider excess minus prior limits.
- Implementation: `JapanTaxLaw/ExcessFinanceGrant75Cap.lean`.
- Independent spec: `JapanTaxLaw/ExcessFinanceGrant75CapSpec.lean`.
- Tests: `JapanTaxLaw/ExcessFinanceGrant75CapTests.lean` (eight kernel-decided examples).
- Review: `docs/adversarial/reviews-excess-finance-grant-75-cap.md`.
- NOT MODELLED: base/excess/limit computation, entity recognition, monthly processing.
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
