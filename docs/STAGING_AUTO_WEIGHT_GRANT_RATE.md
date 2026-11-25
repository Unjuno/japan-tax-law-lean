# STAGING: AutoWeightGrantRate357

- Normative id: NORM|4b3f2123925910ae0cbf27eb99163228afeeb7961f5c09335fc9957585ba6a7a
- Law: 346AC0000000090, revision 346AC0000000090_20260401_508AC0000000002, art. 1(1)
- Clause: 自動車重量譲与税は、自動車重量税法（昭和四十六年法律第八十九号）の規定による自動車重量税の収入額の千分の三百五十七に相当する額とし、市町村（特別区を含む。以下同じ。）及び都道府県に対して譲与するものとする。
- Model: bounded integer per-mille calculation, floor(revenue × 357 / 1000).
- Implementation: `JapanTaxLaw/AutoWeightGrantRate357.lean`.
- Independent spec: `JapanTaxLaw/AutoWeightGrantRate357Spec.lean` (thousand/remainder decomposition).
- Tests: `JapanTaxLaw/AutoWeightGrantRate357Tests.lean` (seven kernel-decided examples).
- Review: `docs/adversarial/reviews-auto-weight-grant-rate.md`.
- NOT MODELLED: 収入額算定、配分方法、端数処理、帰属年度。
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
