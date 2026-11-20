import JapanTaxLaw.SavingsDepositInterest

/-!
# SavingsDepositInterest tests — 納税貯蓄組合法 art.8 smoke checks
Decidable smoke tests, pinned to law 326AC1000000145 / revision 326AC1000000145_20211122_503AC0000000046.
境界: 100000→false / 100001→true（「こえる」は厳密不等式）。
-/

namespace JapanTaxLaw.SavingsDepositInterest

example : thresholdYen = 100_000 := by decide
example : isOverThreshold 0 = false := by decide
example : isOverThreshold 99_999 = false := by decide
example : isOverThreshold 100_000 = false := by decide
example : isOverThreshold 100_001 = true := by decide
example : isOverThreshold 200_000 = true := by decide

end JapanTaxLaw.SavingsDepositInterest
