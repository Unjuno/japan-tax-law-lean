import JapanTaxLaw.InheritanceSuccessiveDeduction

/-!
# InheritanceSuccessiveDeduction tests — 相続税法 art. 20 smoke checks

Decidable smoke tests for art. 20, pinned to
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- successiveRate1 (secondTotalInherited / firstNetEstate, capped at 100%)
example : successiveRate1 50 100 = 50_000 := by decide
example : successiveRate1 100 100 = 100_000 := by decide
example : successiveRate1 150 100 = 100_000 := by decide
example : successiveRate1 0 100 = 0 := by decide

-- successiveRate2 (thisHeir / secondTotalInherited; art. 20 二号には上限の規定はない)
example : successiveRate2 80 100 = 80_000 := by decide
example : successiveRate2 0 100 = 0 := by decide
-- incoherent inputs (本来の意味では thisHeir ≤ secondTotalInherited だが、
-- 与入が誤っているとき法文は上限を与えない — そのまま比を返す（下流の飽和算術が守る）)
example : successiveRate2 150 100 = 150_000 := by decide
example : successiveRate2 100 100 = 100_000 := by decide

-- successiveRate3 (10 - yearsElapsed) / 10 (min 0)
example : successiveRate3 1 = 90_000 := by decide
example : successiveRate3 5 = 50_000 := by decide
example : successiveRate3 9 = 10_000 := by decide
example : successiveRate3 10 = 0 := by decide
example : successiveRate3 11 = 0 := by decide
example : successiveRate3 100 = 0 := by decide

-- successiveDeduction: explicit chain (base × r1 × r2 × r3 / precision divisions)
example : successiveDeduction 1_000_000 2_000_000 2_000_000 1_000_000 0 = 500_000 := by decide
example : successiveDeduction 1_000_000 2_000_000 2_000_000 1_000_000 5 = 250_000 := by decide
example : successiveDeduction 1_000_000 2_000_000 2_000_000 500_000 5 = 125_000 := by decide

end JapanTaxLaw
