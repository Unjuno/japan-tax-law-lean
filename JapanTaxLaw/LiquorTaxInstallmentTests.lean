import JapanTaxLaw.LiquorTaxInstallmentSpec

/-!
# Regression tests — 酒税法 附則八条三項 分割月数

Pure kernel-decided examples plus specification/implementation agreement at
every statutory boundary and at interior points of each band.
-/

namespace JapanTaxLaw.LiquorTaxInstallment

-- Boundary values (端点): 30,000 / 100,000 / 300,000 / 500,000.
example : installmentMonths 30_000 = 1 := by decide
example : installmentMonths 30_001 = 2 := by decide
example : installmentMonths 100_000 = 2 := by decide
example : installmentMonths 100_001 = 3 := by decide
example : installmentMonths 300_000 = 3 := by decide
example : installmentMonths 300_001 = 4 := by decide
example : installmentMonths 500_000 = 4 := by decide
example : installmentMonths 500_001 = 5 := by decide

-- Interior points of each band.
example : installmentMonths 1 = 1 := by decide
example : installmentMonths 50_000 = 2 := by decide
example : installmentMonths 200_000 = 3 := by decide
example : installmentMonths 400_000 = 4 := by decide
example : installmentMonths 10_000_000 = 5 := by decide

-- Universal agreement theorem is a term we can check at representative points.
example : specInstallmentMonths 50_000 (installmentMonths 50_000) :=
  agreeInstallmentMonths 50_000
example : specInstallmentMonths 500_000 (installmentMonths 500_000) :=
  agreeInstallmentMonths 500_000

end JapanTaxLaw.LiquorTaxInstallment
