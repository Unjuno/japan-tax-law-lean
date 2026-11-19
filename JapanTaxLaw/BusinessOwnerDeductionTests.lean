import JapanTaxLaw.BusinessOwnerDeduction

/-!
# BusinessOwnerDeduction tests — kernel-decided smoke checks

Decidable smoke tests for the 地方税法 art. 72の49の14 bounded model, pinned to

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01

No new theorem names are introduced; every check is an `example ... := by decide`.
Boundaries covered: 0, 1, 11, 12, 13 and fractional months (端数切り捨て: 1, 2, 5,
7, 11 — 2_900_000 × months は 12 で割り切れない). The 3項 rounding of partial months
(「一月に満たない端数を一月とする」) is caller-established and is not performed
inside this model; month 0 is checked only as a model artifact, not a value the
caller should pass.
-/

namespace JapanTaxLaw.BusinessOwnerDeduction

open JapanTaxLaw.TaxFinance

-- ==== art. 72の49の14(1): 年額定数（原文「二百九十万円」） ====

example : businessOwnerDeductionFull = 2_900_000 := by decide
example : businessOwnerDeductionFull > 0 := by decide

-- ==== art. 72の49の14(2): 月割（境界 0 / 1 / 11 / 12、端数切り捨て） ====

example : monthlyBusinessDeduction 0 = 0 := by decide
example : monthlyBusinessDeduction 1 = 241_666 := by decide   -- 2_900_000/12 = 241_666 余 8
example : monthlyBusinessDeduction 2 = 483_333 := by decide   -- 余 4
example : monthlyBusinessDeduction 5 = 1_208_333 := by decide -- 余 4
example : monthlyBusinessDeduction 7 = 1_691_666 := by decide -- 余 8
example : monthlyBusinessDeduction 11 = 2_658_333 := by decide -- 余 4
example : monthlyBusinessDeduction 12 = 2_900_000 := by decide -- 割り切れる

-- ==== art. 72の49の14(1)(2): 年額 / 月割の選択（境界 0 / 1 / 11 / 12 / 13） ====

example : businessOwnerDeduction 0 = 0 := by decide
example : businessOwnerDeduction 1 = 241_666 := by decide
example : businessOwnerDeduction 2 = 483_333 := by decide
example : businessOwnerDeduction 11 = 2_658_333 := by decide
example : businessOwnerDeduction 12 = 2_900_000 := by decide
example : businessOwnerDeduction 13 = 2_900_000 := by decide
example : businessOwnerDeduction 24 = 2_900_000 := by decide

-- ==== 境界をまたぐ単調性（月数が増えても控除額は年額を超えない） ====

example : businessOwnerDeduction 11 ≤ businessOwnerDeduction 12 := by decide
example : businessOwnerDeduction 12 = businessOwnerDeduction 13 := by decide

end JapanTaxLaw.BusinessOwnerDeduction
