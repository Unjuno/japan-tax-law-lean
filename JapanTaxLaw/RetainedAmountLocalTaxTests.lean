import JapanTaxLaw.RetainedAmountLocalTax

/-!
# RetainedAmountLocalTax tests — 法人税法施行令 art. 139の10 smoke checks

Decidable smoke tests, pinned to

  Law id: 340CO0000000097
  Revision: 340CO0000000097_20261001_507CO0000000121
  Amendment enforcement date: 2026-10-01

All checks are `by decide` / `rfl` — no theorem names added.
-/

namespace JapanTaxLaw.RetainedAmountLocalTax

open JapanTaxLaw.TaxFinance

-- 率の転記（10.4% = 104/1000、40% = 40/100、20% = 20/100）
example : localTaxBaseRate.numDen = (104, 1000) := rfl
example : donationFortyRate.numDen = (40, 100) := rfl
example : twentyRate.numDen = (20, 100) := rfl

-- 基本額: 10倍過大バグ（1040/1000）の検出
example : baseLocalTax 0 = 0 := by decide
example : baseLocalTax 1 = 0 := by decide
example : baseLocalTax 999 = 103 := by decide
example : baseLocalTax 1000 = 104 := by decide
example : baseLocalTax 100_000 = 10_400 := by decide

-- 調整額: min の両方と境界
example : specialDonationAdjustment 1000 1000 = 200 := by decide  -- 20%側が小さい
example : specialDonationAdjustment 1000 10_000 = 400 := by decide -- 40%側が小さい
example : specialDonationAdjustment 0 1000 = 0 := by decide        -- 寄附金 0
example : specialDonationAdjustment 1000 0 = 0 := by decide        -- 調整地方税額 0
example : specialDonationAdjustment 0 0 = 0 := by decide

-- 控除額: 寄附金なし / 控除あり / 控除 > 基本 で saturating
example : retainedAmountLocalTax 1000 1000 none = 104 := by decide
example : retainedAmountLocalTax 100_000 1000 (some 1000) = 10_200 := by decide
example : retainedAmountLocalTax 100_000 10_000 (some 1000) = 10_000 := by decide
example : retainedAmountLocalTax 1000 1000 (some 1000) = 0 := by decide
example : retainedAmountLocalTax 0 1000 (some 1000) = 0 := by decide
example : retainedAmountLocalTax 0 0 none = 0 := by decide

end JapanTaxLaw.RetainedAmountLocalTax
