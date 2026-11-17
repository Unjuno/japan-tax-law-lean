import JapanTaxLaw.IncomeMiscDeductions

/-!
# IncomeMiscDeductions tests — kernel-decided smoke checks

Decidable smoke tests for the 所得税法 bounded model, pinned to

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01

No new theorem names are introduced; every check is an `example ... := by decide`.
-/

namespace JapanTaxLaw.IncomeMiscDeductions

open JapanTaxLaw.TaxFinance

-- ==== 控除3条: saturating 控除後 ====

-- art. 80 寡婦控除（27万円）
example : widowDeduction = 270_000 := by decide
example : incomeAfterWidowDeduction 1_000_000 = 730_000 := by decide
example : incomeAfterWidowDeduction 270_000 = 0 := by decide
example : incomeAfterWidowDeduction 269_999 = 0 := by decide
example : incomeAfterWidowDeduction 0 = 0 := by decide

-- art. 81 ひとり親控除（35万円）
example : singleParentDeduction = 350_000 := by decide
example : incomeAfterSingleParentDeduction 1_000_000 = 650_000 := by decide
example : incomeAfterSingleParentDeduction 350_000 = 0 := by decide
example : incomeAfterSingleParentDeduction 349_999 = 0 := by decide

-- art. 82 勤労学生控除（27万円）
example : workingStudentDeduction = 270_000 := by decide
example : incomeAfterWorkingStudentDeduction 1_000_000 = 730_000 := by decide
example : incomeAfterWorkingStudentDeduction 270_000 = 0 := by decide

-- ==== 税率条: 金額 × 率（floor） ====

-- art. 211 利益分配 20%
example : profitDistributionRate.num = 20 := by decide
example : profitDistributionWithholdingTax 1_000_000 = 200_000 := by decide
example : profitDistributionWithholdingTax 1 = 0 := by decide
example : profitDistributionWithholdingTax 5 = 1 := by decide
example : profitDistributionWithholdingTax 6 = 1 := by decide

-- art. 209の3 給付補てん金等 15%
example : benefitSupplementRate.num = 15 := by decide
example : benefitSupplementWithholdingTax 1_000_000 = 150_000 := by decide
example : benefitSupplementWithholdingTax 9 = 1 := by decide
example : benefitSupplementWithholdingTax 6 = 0 := by decide

-- art. 182 利子等 15% / 配当等 20%（2区分）
example : interestWithholdingRate.num = 15 := by decide
example : dividendWithholdingRate.num = 20 := by decide
example : article182WithholdingTax false 1_000_000 = 150_000 := by decide
example : article182WithholdingTax true 1_000_000 = 200_000 := by decide
example : article182WithholdingTax true 1_000_000 > article182WithholdingTax false 1_000_000 := by decide
example : article182WithholdingTax true 1 = 0 := by decide

-- art. 170 国内源泉所得 20%（一部 15%）
example : separateTaxationRate.num = 20 := by decide
example : separateTaxationReducedRate.num = 15 := by decide
example : article170SeparateTax false 1_000_000 = 200_000 := by decide
example : article170SeparateTax true 1_000_000 = 150_000 := by decide
example : article170SeparateTax true 1_000_000 < article170SeparateTax false 1_000_000 := by decide

end JapanTaxLaw.IncomeMiscDeductions
