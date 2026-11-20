import JapanTaxLaw.TaxFinance

/-!
# DisasterVictimIncomeLimit — 災害被害者租税減免法 art.2（合計所得金額七百五十万円以下）

Pinned source:
  Law id: 322AC0000000175
  Revision: 322AC0000000175_20220101_503AC0000000011
  Raw snapshot: data/raw/322AC0000000175_20220101_503AC0000000011.law.json
  sha256: c3bb5b0bdffbdefd2ee5f358d90ad9e0922d4c887ecb2b133aa7d613f5f4e7ef
  Normative unit id: NORM|ef7f5c0f1105d358392be865c4f7bac9f076278926d6a9faa8be0e5f000d68a2
  Source path: LawBody[1]/MainProvision/MainProvision[1]/Article:2/Article#2/
               Paragraph#1/List/ListSentence/Column#1/Sentence#1
  Statutory article: art. 2(1) (CONDITION / income threshold)

原文逐語（pinned, 一字一句改変なし）:
  「合計所得金額が七百五十万円以下であるとき」

Variable contract:
  `totalIncome : Money` = 合計所得金額 (total income amount), unit 円 (yen),
  domain Nat.  `incomeLimit : Money := 7_500_000` = 七百五十万円.
  Result: the CONDITION holds iff totalIncome ≤ incomeLimit (inclusive 「以下」).

Scope: only this income-threshold condition. In art.2(1) this 7.5M clause
selects the 5/10 reduction row (≤5M → full; ≤7.5M → 5/10; >7.5M → 2.5/10);
the statutory ELIGIBILITY ceiling is a distinct 千万円 (10M) condition. Hence
`withinIncomeLimit` is a rate-bracket predicate, NOT the relief qualification
test — downstream consumers must not read it as the eligibility ceiling. The
other conditions of art.2(1), the substantive tax relief/deferment effects,
other paragraphs, 政令 details and the definition of 合計所得金額 are NOT
MODELLED. Computable slice of one norm unit.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterVictimIncomeLimit

open JapanTaxLaw.TaxFinance

/-- 七百五十万円. Unit 円; domain Nat. -/
def incomeLimit : Money := 7_500_000

/-- 「合計所得金額が七百五十万円以下」: inclusive threshold condition. -/
def withinIncomeLimit (totalIncome : Money) : Prop :=
  totalIncome ≤ incomeLimit

end JapanTaxLaw.DisasterVictimIncomeLimit
