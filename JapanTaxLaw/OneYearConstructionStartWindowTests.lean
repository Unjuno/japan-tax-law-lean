import JapanTaxLaw.OneYearConstructionStartWindow
import JapanTaxLaw.OneYearConstructionStartWindowSpec

/-
# OneYearConstructionStartWindowTests — 半島振興法施行令 4(1)(2) の kernel-decided 検証

Pinned: law 407M50000008012 / revision 407M50000008012_20050401_417M60000008064.
Coverage: strict lower bound (翌日), inclusive one-year upper bound,
pre-certification acquisition, zero/small inputs and impl/spec agreement.
Uses an explicit oneYearDays = 365 for finite smoke checks only.
-/

namespace JapanTaxLaw.OneYearConstructionStartWindow

example : yearCount = 1 := by decide

-- 零入力・小さい入力
example : eligibleLand 0 0 0 365 = false := by decide
example : eligibleLand 0 0 1 365 = true := by decide
example : eligibleLand 0 1 2 365 = true := by decide

-- 厳密下限: 取得日丁度は不可、翌日から可
example : eligibleLand 0 10 10 365 = false := by decide
example : eligibleLand 0 10 11 365 = true := by decide

-- 一年以内の inclusive 上限
example : eligibleLand 0 10 374 365 = true := by decide
example : eligibleLand 0 10 375 365 = true := by decide
example : eligibleLand 0 10 376 365 = false := by decide

-- 認定日より前の取得
example : eligibleLand 10 9 100 365 = false := by decide

-- impl / 独立仕様の一致
example : yearCount = specYearCount := by decide
example : eligibleLand 0 0 0 365 = specEligibleLand 0 0 0 365 := by decide
example : eligibleLand 0 10 10 365 = specEligibleLand 0 10 10 365 := by decide
example : eligibleLand 0 10 11 365 = specEligibleLand 0 10 11 365 := by decide
example : eligibleLand 0 10 375 365 = specEligibleLand 0 10 375 365 := by decide
example : eligibleLand 0 10 376 365 = specEligibleLand 0 10 376 365 := by decide
example : eligibleLand 10 9 100 365 = specEligibleLand 10 9 100 365 := by decide

end JapanTaxLaw.OneYearConstructionStartWindow
