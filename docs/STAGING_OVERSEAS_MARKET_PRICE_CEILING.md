# STAGING: OverseasMarketPriceCeiling

- Normative id: NORM|00bb2915da9151a74e59bcebb3940b8cb7f27ba3b99efdfb8bcef1576f1a097c
- Law: 344M50000040016, revision 344M50000040016_20260401_508M60000040016, art. 2_4(2)
- Clause: 一個（現に使用中のもので海外市価（外国においてその物品を購入する際に支払われた又は支払われるべき価格をいう。以下この条において同じ。）三万円以下のものに限る。次号において同じ。）
- Model: threshold on provider overseas market price (<= 30000 yen).
- Implementation: `JapanTaxLaw/OverseasMarketPriceCeiling.lean`.
- Independent spec: `JapanTaxLaw/OverseasMarketPriceCeilingSpec.lean`.
- Tests: `JapanTaxLaw/OverseasMarketPriceCeilingTests.lean` (six kernel-decided examples).
- Review: `docs/adversarial/reviews-overseas-market-price-ceiling.md`.
- NOT MODELLED: used-goods recognition, item identification, price computation, next item.
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
