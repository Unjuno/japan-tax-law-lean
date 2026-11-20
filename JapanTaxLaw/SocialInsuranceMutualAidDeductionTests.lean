import JapanTaxLaw.SocialInsuranceMutualAidDeduction

/-!
# SocialInsuranceMutualAidDeduction tests — art. 34(1）三号・四号 smoke checks

Decidable smoke tests for the social insurance and small enterprise mutual aid
deductions, pinned to
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 34(1)第三号: 支払った又は給与から控除される金額そのまま
example : socialInsuranceDeduction 0 = 0 := by decide
example : socialInsuranceDeduction 100_000 = 100_000 := by decide
example : socialInsuranceDeduction 4_560_000 = 4_560_000 := by decide

-- art. 34(1)第四号: イ＋ロ＋ハ の合計額
example : smallEnterpriseMutualAidDeduction ⟨0, 0, 0⟩ = 0 := by decide
example : smallEnterpriseMutualAidDeduction ⟨120_000, 0, 0⟩ = 120_000 := by decide
example : smallEnterpriseMutualAidDeduction ⟨0, 240_000, 0⟩ = 240_000 := by decide
example : smallEnterpriseMutualAidDeduction ⟨0, 0, 80_000⟩ = 80_000 := by decide
example : smallEnterpriseMutualAidDeduction ⟨120_000, 240_000, 80_000⟩ = 440_000 := by decide
-- 上限なし・境界
example : smallEnterpriseMutualAidDeduction ⟨999_999_999, 999_999_999, 999_999_999⟩ = 2_999_999_997 := by decide
-- イのみ大きい場合
example : smallEnterpriseMutualAidDeduction ⟨250_000, 0, 0⟩ = 250_000 := by decide

-- 小さい正の入力（1..13）の境界: identity 定義 socialInsuranceDeduction x = x より 10 → 10
example : socialInsuranceDeduction 10 = 10 := by decide

end JapanTaxLaw
