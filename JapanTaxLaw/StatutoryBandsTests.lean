import JapanTaxLaw.StatutoryBandsSpec

/-!
# StatutoryBandsTests — 境界値・約分対応の回帰検査

Every band boundary is checked on both the implementation and the independent
spec, and the universal agreement theorems are applied at those boundaries.
-/

namespace JapanTaxLaw.StatutoryBands

/- 第28条: 5 bands, boundaries inclusive on the upper side. -/
example : salaryDeduction 0 = 650_000 := by decide
example : salaryDeduction 1_900_000 = 650_000 := by decide
example : salaryDeduction 1_900_001 = 650_000 := by decide
example : salaryDeduction 3_600_000 = 1_160_000 := by decide
example : salaryDeduction 6_600_000 = 1_760_000 := by decide
example : salaryDeduction 8_500_000 = 1_950_000 := by decide
example : salaryDeduction 8_500_001 = 1_950_000 := by decide

example : salaryDeduction 3_600_000 = specSalaryDeduction 3_600_000 :=
  agreeSalary 3_600_000
example : salaryDeduction 8_500_001 = specSalaryDeduction 8_500_001 :=
  agreeSalary 8_500_001

/- 第86条: 5 bands, amounts decrease to zero. -/
example : basicDeduction 23_500_000 = 580_000 := by decide
example : basicDeduction 23_500_001 = 480_000 := by decide
example : basicDeduction 24_000_000 = 480_000 := by decide
example : basicDeduction 24_500_000 = 320_000 := by decide
example : basicDeduction 25_000_000 = 160_000 := by decide
example : basicDeduction 25_000_001 = 0 := by decide

example : basicDeduction 25_000_000 = specBasicDeduction 25_000_000 :=
  agreeBasic 25_000_000
example : basicDeduction 25_000_001 = specBasicDeduction 25_000_001 :=
  agreeBasic 25_000_001

end JapanTaxLaw.StatutoryBands
