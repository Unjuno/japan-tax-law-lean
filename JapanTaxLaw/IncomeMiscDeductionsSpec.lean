import JapanTaxLaw.IncomeMiscDeductions

/-!
# IncomeMiscDeductions spec — independent integer restatement of
   所得税法 art. 80 / 81 / 82 と art. 170 / 182 / 209の3 / 211

Sources (pinned; identical to IncomeMiscDeductions.lean):

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 94C4A7AD83726CDE60787967ED4E959585AD0AF9279D25DB9AA02264B3FE606B

This file restates the statutory arithmetic independently in plain `Nat`, without
`TaxRate.applyFloor`: the percentages are written directly as `* 20 / 100` etc.,
and the saturating deductions as an explicit `if` (rather than relying on Nat
subtraction underflow). `agreeIncomeMiscDeductions` checks that the implementation
and this independent restatement coincide at a fixed set of points (kernel `decide`).

Scope boundaries are identical to the implementation. In particular the eligibility
booleans (寡婦／ひとり親／勤労学生、利子等／配当等、161条1項8号・15号該当) are
caller-established and are never used to derive an amount inside this model.
-/

namespace JapanTaxLaw.IncomeMiscDeductions

open JapanTaxLaw.TaxFinance

-- ==== 控除3条: 独立定式 ====

def specWidowDeduction : Nat := 270_000
def specSingleParentDeduction : Nat := 350_000
def specWorkingStudentDeduction : Nat := 270_000

/-- 控除後 = 総所得 − 控除額、ただし総所得が控除額未満なら 0（saturating）。 -/
def specIncomeAfter (totalIncome deduction : Nat) : Nat :=
  if deduction ≤ totalIncome then totalIncome - deduction else 0

def specIncomeAfterWidowDeduction (totalIncome : Nat) : Nat :=
  specIncomeAfter totalIncome specWidowDeduction

def specIncomeAfterSingleParentDeduction (totalIncome : Nat) : Nat :=
  specIncomeAfter totalIncome specSingleParentDeduction

def specIncomeAfterWorkingStudentDeduction (totalIncome : Nat) : Nat :=
  specIncomeAfter totalIncome specWorkingStudentDeduction

-- ==== 税率条: 独立定式（TaxRate.applyFloor を使わない） ====

/-- art. 211: 利益分配額 × 20 / 100。 -/
def specProfitDistributionWithholdingTax (amount : Nat) : Nat := amount * 20 / 100

/-- art. 209の3: 給付補てん金等 × 15 / 100。 -/
def specBenefitSupplementWithholdingTax (amount : Nat) : Nat := amount * 15 / 100

/-- art. 182: 配当等 20%、利子等 15%。 -/
def specArticle182WithholdingTax (isDividend : Bool) (amount : Nat) : Nat :=
  if isDividend then amount * 20 / 100 else amount * 15 / 100

/-- art. 170: 原則 20%、一部（161条1項8号・15号）15%。 -/
def specArticle170SeparateTax (isReduced : Bool) (amount : Nat) : Nat :=
  if isReduced then amount * 15 / 100 else amount * 20 / 100

-- ==== points（独立定式のスモーク） ====

example : specWidowDeduction = 270_000 := by decide
example : specSingleParentDeduction = 350_000 := by decide
example : specWorkingStudentDeduction = 270_000 := by decide

example : specIncomeAfterWidowDeduction 1_000_000 = 730_000 := by decide
example : specIncomeAfterWidowDeduction 270_000 = 0 := by decide
example : specIncomeAfterWidowDeduction 100_000 = 0 := by decide
example : specIncomeAfterSingleParentDeduction 1_000_000 = 650_000 := by decide
example : specIncomeAfterSingleParentDeduction 350_000 = 0 := by decide
example : specIncomeAfterWorkingStudentDeduction 1_000_000 = 730_000 := by decide
example : specIncomeAfterWorkingStudentDeduction 270_000 = 0 := by decide

example : specProfitDistributionWithholdingTax 1_000_000 = 200_000 := by decide
example : specProfitDistributionWithholdingTax 5 = 1 := by decide
example : specBenefitSupplementWithholdingTax 1_000_000 = 150_000 := by decide
example : specBenefitSupplementWithholdingTax 9 = 1 := by decide
example : specArticle182WithholdingTax true 1_000_000 = 200_000 := by decide
example : specArticle182WithholdingTax false 1_000_000 = 150_000 := by decide
example : specArticle170SeparateTax true 1_000_000 = 150_000 := by decide
example : specArticle170SeparateTax false 1_000_000 = 200_000 := by decide

-- ==== agreement（impl ↔ spec、全項目を == で比較） ====

/-- 実装と独立定式が全テスト点で一致するか（列挙された有限点のみ；全称主張ではない）。 -/
def agreeIncomeMiscDeductions : Bool :=
  let totals := [0, 100_000, 269_999, 270_000, 270_001, 350_000, 500_000, 1_000_000, 12_345_678]
  let amounts := [0, 1, 3, 5, 7, 9, 99, 100, 101, 1_000, 1_000_000, 12_345_678]
  (totals.all fun t =>
      incomeAfterWidowDeduction t == specIncomeAfterWidowDeduction t &&
      incomeAfterSingleParentDeduction t == specIncomeAfterSingleParentDeduction t &&
      incomeAfterWorkingStudentDeduction t == specIncomeAfterWorkingStudentDeduction t) &&
  (amounts.all fun m =>
      profitDistributionWithholdingTax m == specProfitDistributionWithholdingTax m &&
      benefitSupplementWithholdingTax m == specBenefitSupplementWithholdingTax m &&
      article182WithholdingTax true m == specArticle182WithholdingTax true m &&
      article182WithholdingTax false m == specArticle182WithholdingTax false m &&
      article170SeparateTax true m == specArticle170SeparateTax true m &&
      article170SeparateTax false m == specArticle170SeparateTax false m)

example : agreeIncomeMiscDeductions = true := by decide

end JapanTaxLaw.IncomeMiscDeductions
