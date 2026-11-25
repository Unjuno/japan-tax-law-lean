import JapanTaxLaw.TaxFinance

/-!
# EqualLevyIncomeRequirement — 道府県民税 均等割 Non-Taxable の所得要件（地方税法 art.23 §1）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article Num 23 §1, flat/normalized leaf text 8258 chars. Needles contain no U+3000.

原文逐語:
  「（２）前年の合計所得金額が五百万円以下であること。」

Computation（原文逐語から導出、所得要件の判定のみ、単位: 円）:
  meetsIncomeRequirement(prevYearTotalIncome) = prevYearTotalIncome <= 5000000  （五百万円以下）

Scope / NOT MODELLED:
  -他の要件（（１）扶養親族を有すること、（３）事実上婚姻関係と同様の事由）は NOT MODELLED。
  - 「合計所得金額」の算定・均等割の適用効果・市町村民税側の规定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.EqualLevyIncomeRequirement

open JapanTaxLaw.TaxFinance

/-- 前年の合計所得金額が 500 万円以下か。 -/
def meetsIncomeRequirement (prevIncome : Money) : Bool := prevIncome <= 5000000

example : meetsIncomeRequirement 0 = true := by decide
example : meetsIncomeRequirement 5000000 = true := by decide  -- ちょうどは可
example : meetsIncomeRequirement 5000001 = false := by decide
example : meetsIncomeRequirement 10000000 = false := by decide

end JapanTaxLaw.EqualLevyIncomeRequirement
