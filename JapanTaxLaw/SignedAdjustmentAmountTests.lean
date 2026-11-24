import JapanTaxLaw.SignedAdjustmentAmountSpec

/-
Kernel-decided examples for 第五条 (four-step signed adjustment chain).
Contract: base = 前条の規定によって算定した額, item1 = 第一号の額 (deducted),
item2 = 第二号の額 (added; when negative, its absolute value is deducted),
item3 = 第三号の額 (deducted); the result is a signed Int amount (円).
Boundary literals 7 (令和七年度), 8 (令和八年) and 3 (三月) are exercised as inputs.
-/

namespace JapanTaxLaw.SignedAdjustmentAmountTests

open JapanTaxLaw.SignedAdjustmentAmount
open JapanTaxLaw.SignedAdjustmentAmountSpec

-- statutory constants (impl and independent spec)
example : targetYear = 8 := by decide
example : targetMonth = 3 := by decide
example : baseYear = 7 := by decide
example : specYear = 8 := by decide
example : specMonth = 3 := by decide
example : specBaseYear = 7 := by decide

-- canonical computation cases (negative item2 => subtract its absolute value)
example : grantAmount 100 10 5 3 = 92 := by decide
example : grantAmount 100 10 (-5) 3 = 82 := by decide
example : grantAmount 100 10 5 20 = 75 := by decide
example : grantAmount 0 0 0 0 = 0 := by decide

-- the independent spec on the same cases
example : specCompute 100 10 5 3 = 92 := by decide
example : specCompute 100 10 (-5) 3 = 82 := by decide
example : specCompute 100 10 5 20 = 75 := by decide
example : specCompute 0 0 0 0 = 0 := by decide

-- boundary inputs at / below / above the statutory literals 7, 8, 3
example : grantAmount 100 10 7 3 = 94 := by decide
example : grantAmount 100 10 8 3 = 95 := by decide
example : grantAmount 100 10 6 3 = 93 := by decide
example : grantAmount 100 10 5 4 = 91 := by decide
example : grantAmount 100 10 7 2 = 95 := by decide
example : grantAmount 100 10 8 4 = 94 := by decide

-- impl/spec agreement through the universal kernel bridges
example : targetYear = specYear := agreeYear
example : targetMonth = specMonth := agreeMonth
example : baseYear = specBaseYear := agreeBaseYear
example : grantAmount 100 10 5 3 = specCompute 100 10 5 3 := agreeCompute 100 10 5 3
example : grantAmount 100 10 (-5) 3 = specCompute 100 10 (-5) 3 := agreeCompute 100 10 (-5) 3
example : grantAmount 0 0 0 0 = specCompute 0 0 0 0 := agreeCompute 0 0 0 0

end JapanTaxLaw.SignedAdjustmentAmountTests
