# STAGING: OrganizationChangeNetAssets

- Normative id: NORM|4be496509f8d5142008b02da6f331d4460799214070cf2cde97be1a7707d0711
- Law: 342M50000040037, revision 342M50000040037_20260401_508M60000040008, art. 12(1)
- Clause: 組織変更をする会社の当該組織変更の直前における資産の額から負債の額を控除した額（当該控除した額がイに掲げる額以下である場合にあつては、イに掲げる額）
- Model: provider assets minus liabilities, floored at a provider amount.
- Implementation: `JapanTaxLaw/OrganizationChangeNetAssets.lean`.
- Independent spec: `JapanTaxLaw/OrganizationChangeNetAssetsSpec.lean`.
- Tests: `JapanTaxLaw/OrganizationChangeNetAssetsTests.lean` (six kernel-decided examples).
- Review: `docs/adversarial/reviews-organization-change-net-assets.md`.
- NOT MODELLED: floor computation, asset/liability valuation, organization-change procedure.
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
