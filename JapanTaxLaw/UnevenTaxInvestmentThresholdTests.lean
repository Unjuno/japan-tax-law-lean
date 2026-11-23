import JapanTaxLaw.UnevenTaxInvestmentThreshold

/-!
# UnevenTaxInvestmentThreshold tests — 投資額基準 smoke checks
Decidable smoke tests, pinned to law 407M50000008016 / revision 407M50000008016_20250401_507M60000008028.
資本金 1千万超→1千万、5千万超→2千万。
-/

namespace JapanTaxLaw.UnevenTaxInvestmentThreshold

example : investmentThreshold 1000 = 500 := by decide
example : investmentThreshold 1001 = 1000 := by decide
example : investmentThreshold 5000 = 1000 := by decide
example : investmentThreshold 5001 = 2000 := by decide

end JapanTaxLaw.UnevenTaxInvestmentThreshold
