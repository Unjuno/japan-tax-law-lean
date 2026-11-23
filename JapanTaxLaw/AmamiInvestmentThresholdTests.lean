import JapanTaxLaw.AmamiInvestmentThreshold

/-!
# AmamiInvestmentThreshold tests — 投資額基準 smoke checks
Decidable smoke tests, pinned to law 411M50000008014 / revision 411M50000008014_20240401_506M60000008035.
資本金5千万超→1千万、1億超→2千万。
-/

namespace JapanTaxLaw.AmamiInvestmentThreshold

example : investmentThreshold 5000 = 500 := by decide
example : investmentThreshold 5001 = 1000 := by decide
example : investmentThreshold 10000 = 1000 := by decide
example : investmentThreshold 10001 = 2000 := by decide

end JapanTaxLaw.AmamiInvestmentThreshold
