# STAGING: GrantErrorRounding1000

- Normative id: NORM|05a5899479614efa11da83a033d254670bff34951e00ba08a11b856cbbc5630c
- Law: 331M50000002007, revision 331M50000002007_20230401_505M60000008036, art. 8(3)
- Clause: 第一項の都道府県又は市町村に譲与すべき額に加算し、又は当該譲与すべき額から減額すべき錯誤に係る額に千円未満の端数金額があるときは、その端数金額を控除した金額をもつて、当該錯誤にかかる額とする。
- Model: bounded truncation of an erroneous grant amount to 1000-yen units.
- Implementation: `JapanTaxLaw/GrantErrorRounding1000.lean` (remainder + subtraction).
- Independent spec: `JapanTaxLaw/GrantErrorRounding1000Spec.lean` (division + multiplication).
- Tests: `JapanTaxLaw/GrantErrorRounding1000Tests.lean` (seven kernel-decided examples).
- Review: `docs/adversarial/reviews-grant-error-rounding.md`.
- NOT MODELLED: 加算/減額の別、錯誤認定、第一項譲与額算定、他条の端数処理。
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
