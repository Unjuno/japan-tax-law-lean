# STAGING: TreasuryCollectionNet

- Normative id: NORM|fb11fb27038e069e40cf5a7335a457a5e159a7acf4f6c409f65a67d3b31a8a1b
- Law: 329AC0000000036, revision 329AC0000000036_20240101_431AC0000000003, art. 14(1)
- Clause: 財務大臣は、毎会計年度、政令で定めるところにより、当該年度の初日から翌年度の五月三十一日までの期間内において資金に受け入れた国税収納金等（国税に係る返納金で政令で定めるもの並びに特定地方税及びこれに係る返納金を除く。）で当該年度に所属するものの額から当該年度において支払の決定をした過誤納金の還付金等…
- Model: bounded saturating arithmetic; net = receipts − refunds, gated by an explicit period provider.
- Implementation: `JapanTaxLaw/TreasuryCollectionNet.lean`.
- Independent spec: `JapanTaxLaw/TreasuryCollectionNetSpec.lean`.
- Tests: `JapanTaxLaw/TreasuryCollectionNetTests.lean` (six kernel-decided examples).
- Review: `docs/adversarial/reviews-treasury-collection-net.md`.
- NOT MODELLED: 日付計算、政令の返納金区分、特定地方税の除外、会計区分。
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
