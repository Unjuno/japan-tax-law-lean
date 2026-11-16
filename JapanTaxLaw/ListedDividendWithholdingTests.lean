import JapanTaxLaw.ListedDividendWithholding

/-!
# ListedDividendWithholding tests — art. 9の3の二 smoke checks

Decidable smoke tests for the withholding computation, pinned to
  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01

Each example covers a boundary, a deduction limit, or the 15%/20% bracket.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 大口株主等（第一号）以外は 15%
example : withholdingNet ⟨false, 100_000, 0⟩ = 15_000 := by decide
example : withholdingNet ⟨false, 1_000_000, 0⟩ = 150_000 := by decide
example : withholdingNet ⟨false, 10_000_000_000, 0⟩ = 1_500_000_000 := by decide
-- 大口株主等（第一号）は 20%
example : withholdingNet ⟨true, 100_000, 0⟩ = 20_000 := by decide
example : withholdingNet ⟨true, 1_000_000, 0⟩ = 200_000 := by decide

-- art. 9の3の二(1): 交付をする金額に控除対象金額を加算
example : withholdingBase ⟨false, 1_000_000, 50_000⟩ = 1_050_000 := by decide

-- art. 9の3の二(3): 控除は所得税の額を限度（外国税のほうが小さい場合）
example : withholdingNet ⟨false, 1_000_000, 50_000⟩ = 107_500 := by decide
-- 控除は所得税の額を限度（外国税のほうが大きい場合）
example : withholdingNet ⟨false, 100_000, 50_000⟩ = 0 := by decide
example : withholdingNet ⟨true, 10_000_000, 100_000⟩ = 1_920_000 := by decide
-- 外国税等が税額を覆うとき（加算後 base の 20% が外国税控除額以下 になるには）
example : withholdingNet ⟨true, 1_000_000, 250_000⟩ = 0 := by decide
-- 控除はあくまで所得税の額を限度とする（100% deduction にはならない）
example : withholdingNet ⟨false, 1_000_000, 157_500⟩ = 16_125 := by decide

-- 0 交付だが加算金があっても控除する
example : withholdingNet ⟨false, 0, 50_000⟩ = 0 := by decide
example : withholdingNet ⟨true, 0, 100_000⟩ = 0 := by decide
-- 大口株主と非大口株主で、foreignTax が同じときの徴収額の差
example : withholdingNet ⟨true, 1_000_000, 100_000⟩ = 120_000 := by decide
example : withholdingNet ⟨false, 1_000_000, 100_000⟩ = 65_000 := by decide

end JapanTaxLaw
