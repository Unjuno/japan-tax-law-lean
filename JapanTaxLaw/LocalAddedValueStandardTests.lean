import JapanTaxLaw.LocalAddedValueStandard

/-!
# LocalAddedValueStandardTests — 地方税法 art. 72の20 の smoke checks

Decidable kernel-decided smoke tests, pinned to

  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01

境界（ちょうど 70% → false／70% 超 → true）、収益配分額零、
控除すべき額が報酬給与額を超える場合、控除額が付加価値額を超える場合、
および第1項・第2項の合成を確認する。

NOT MODELLED: 前条の控除額・付加価値額・報酬給与額・収益配分額・該当性
（すべて caller-established）、3項の政令みなし額（impl の doc-comment 参照）。

-/

namespace JapanTaxLaw.LocalAddedValueStandard

open JapanTaxLaw.TaxFinance

-- 第1項 境界: ちょうど 70% → false
example : salaryRatioExceeds70 100 70 = false := by decide
example : salaryRatioExceeds70 1000 700 = false := by decide
example : salaryRatioExceeds70 300 210 = false := by decide
-- 第1項 境界: 70% 超 → true
example : salaryRatioExceeds70 100 71 = true := by decide
example : salaryRatioExceeds70 1000 701 = true := by decide
example : salaryRatioExceeds70 300 211 = true := by decide
-- 第1項: 70% 未満 → false
example : salaryRatioExceeds70 100 69 = false := by decide
example : salaryRatioExceeds70 0 0 = false := by decide

-- 収益配分額零でも安全（停止する）
example : salaryRatioExceeds70 0 1 = true := by decide

-- 第2項: 雇用安定控除額 = 報酬給与額 − 収益配分額 × 70/100
example : employmentStabilityDeduction 100 71 = 1 := by decide
example : employmentStabilityDeduction 1000 701 = 1 := by decide
example : employmentStabilityDeduction 0 50 = 50 := by decide
-- 控除すべき額が報酬給与額を超える → 飽和して 0
example : employmentStabilityDeduction 100 10 = 0 := by decide
example : employmentStabilityDeduction 100 70 = 0 := by decide

-- 第1項: 課税標準 = 付加価値額 − 雇用安定控除額
example : addedValueStandard 1000 70 = 930 := by decide
-- 控除額 > 付加価値額 → 0
example : addedValueStandard 50 100 = 0 := by decide
example : addedValueStandard 0 1 = 0 := by decide
example : addedValueStandard 100 100 = 0 := by decide

-- 第1項・第2項の合成
example : addedValueStandard 1000 (employmentStabilityDeduction 100 71) = 999 := by decide
example : addedValueStandard 1000 (employmentStabilityDeduction 100 70) = 1000 := by decide

end JapanTaxLaw.LocalAddedValueStandard
