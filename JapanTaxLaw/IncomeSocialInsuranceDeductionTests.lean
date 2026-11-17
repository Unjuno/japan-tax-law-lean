import JapanTaxLaw.IncomeSocialInsuranceDeduction

/-!
# IncomeSocialInsuranceDeduction tests — kernel-decided smoke checks

Decidable smoke tests for the 所得税法 art. 74 bounded model, pinned to

  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01

No new theorem names are introduced; every check is an `example ... := by decide`.
Covers 0, fractional/odd amounts (端数), and the paid > total underflow case.
-/

namespace JapanTaxLaw.IncomeSocialInsuranceDeduction

open JapanTaxLaw.TaxFinance

-- ==== art. 74(1): 控除額 = 支払額そのもの（上限・率なし） ====

example : socialInsuranceDeduction 0 = 0 := by decide
example : socialInsuranceDeduction 1 = 1 := by decide
example : socialInsuranceDeduction 101 = 101 := by decide               -- 端数
example : socialInsuranceDeduction 250_000 = 250_000 := by decide
example : socialInsuranceDeduction 1_000_000_000 = 1_000_000_000 := by decide

-- ==== art. 74(1): 控除後（saturating） ====

example : taxableAfterSocialInsurance 1_000_000 250_000 = 750_000 := by decide
example : taxableAfterSocialInsurance 250_000 250_000 = 0 := by decide  -- 同額
example : taxableAfterSocialInsurance 101 3 = 98 := by decide           -- 端数
example : taxableAfterSocialInsurance 1_000 1 = 999 := by decide        -- 端数

-- ==== paid > total のアンダーフロー（0 クランプ） ====

example : taxableAfterSocialInsurance 100_000 250_000 = 0 := by decide
example : taxableAfterSocialInsurance 0 1 = 0 := by decide
example : taxableAfterSocialInsurance 0 0 = 0 := by decide

end JapanTaxLaw.IncomeSocialInsuranceDeduction
