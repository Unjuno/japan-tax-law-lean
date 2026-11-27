# STAGING: TaxAccountantExamExemption

- Normative id: NORM|048aa353ea02c717841c6c88cc52e793e1aca0369d0e006568a840fd4a731f7d
- Law: 326AC1000000237, revision 326AC1000000237_20251001_505AC0000000053, art. 8(2)
- Clause: 前項第一号又は第四号から第九号までに規定する職又は事務のうち、試験の免除科目を同じくする職又は事務の二以上に従事した者に対しては、それぞれ当該職又は事務についてこれらの号に規定する年数を十年とする割合により年数を換算してこれらの職又は事務の二以上に従事した期間を通算した場合に、その期間が十年以上になるときは、その申請により、税理士試験において当該科目の試験を免除する。
- Model: two-role year conversion (prescribed -> 10) and 10-year aggregation.
- Implementation: `JapanTaxLaw/TaxAccountantExamExemption.lean`.
- Independent spec: `JapanTaxLaw/TaxAccountantExamExemptionSpec.lean`.
- Tests: `JapanTaxLaw/TaxAccountantExamExemptionTests.lean` (eight kernel-decided examples).
- Review: `docs/adversarial/reviews-tax-accountant-exam-exemption.md`.
- NOT MODELLED: role/subject recognition, three or more roles, rounding details, application procedure.
- Status axes: 技術的検証待ち / 形式化未完了 / 法的レビュー未完了。
  Human legal review remains LEGAL_REVIEW_PENDING; no approval is claimed.
