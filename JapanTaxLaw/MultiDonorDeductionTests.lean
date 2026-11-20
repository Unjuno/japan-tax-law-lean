import JapanTaxLaw.MultiDonorDeduction

/-!
# MultiDonorDeduction tests — 相続税法施行令 art.5の2 smoke checks
Decidable smoke tests, pinned to law 325CO0000000071 / revision 325CO0000000071_20260401_506CO0000000143.
境界: total=0（適用外、0 を返す total 函数）/ 完全割合 / 端数切捨て。有限領域の smoke。
-/

namespace JapanTaxLaw.MultiDonorDeduction

example : baseDeductionYen = 600_000 := by decide
example : donorDeductionYen 1 1 = 600_000 := by decide
example : donorDeductionYen 2 1 = 300_000 := by decide
example : donorDeductionYen 4 1 = 150_000 := by decide
example : donorDeductionYen 3 1 = 200_000 := by decide
example : donorDeductionYen 3 2 = 400_000 := by decide
example : donorDeductionYen 7 3 = 257_142 := by decide
example : donorDeductionYen 0 0 = 0 := by decide

end JapanTaxLaw.MultiDonorDeduction
