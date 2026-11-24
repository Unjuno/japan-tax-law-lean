# STAGING: CustomsAdditionalDutyCeiling

- Normative id: NORM|6f539e8731e012eed30b16cceef593768d521afcc1dbef314ac47b5b7929dbb3
- Law: 143AC0000000054, revision 143AC0000000054_20260601_508AC0000000005, art. 9(1)(1)
- Clause: 指定された期間内に輸入される指定された貨物の全部につき、又は当該貨物のうち一定の数量若しくは額を超えるものにつき、別表の税率による関税のほか、当該貨物の課税価格とこれと同種又は類似の貨物の本邦における適正と認められる卸売価格（類似の貨物にあつては、当該貨物の性質及び取引方法の差異による価格の相違を勘案して合理的に必要と認められる調整を加えた価格）との差額から別表の税率による関税の額を控除した額以下の関税を課すること。
- Model: bounded saturating arithmetic; ceiling = (課税価格 − 適正卸売価格) − 別表関税額.
- Implementation: `JapanTaxLaw/CustomsAdditionalDutyCeiling.lean`.
- Independent spec: `JapanTaxLaw/CustomsAdditionalDutyCeilingSpec.lean`.
- Tests: `JapanTaxLaw/CustomsAdditionalDutyCeilingTests.lean` (eight kernel-decided examples).
- Review: `docs/adversarial/reviews-customs-duty-ceiling.md`.
- NOT MODELLED: 指定期間・指定貨物・価格調整・適正価格認定・別表税率・数量/額要件。
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
