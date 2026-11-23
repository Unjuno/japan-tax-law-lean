import JapanTaxLaw.InvestmentIncomeBelowHalf
import JapanTaxLaw.InvestmentIncomeBelowHalfSpec

/-
# InvestmentIncomeBelowHalfTests — kernel-decided boundary checks for 投資関連所得割合百分の五十未満

Pinned: law 362CO0000000335, revision 362CO0000000335_20260521_506CO0000000150.
STRICT below: 百分の五十に満たない means p < 50; p = 50 fails (NOT 以下), p = 49 qualifies.
Boundary categories: zero (0), small_input (1), threshold_below (49),
threshold_at (50, 100), threshold_above (51); plus 99 (just below the 百分 denominator 100,
still above 50, hence false).
-/

namespace JapanTaxLaw.InvestmentIncomeBelowHalf

example : belowHalf 0 = true := by decide
example : belowHalf 1 = true := by decide
example : belowHalf 49 = true := by decide
example : belowHalf 50 = false := by decide
example : belowHalf 51 = false := by decide
example : belowHalf 99 = false := by decide
example : belowHalf 100 = false := by decide

example : specBelow 0 = true := by decide
example : specBelow 49 = true := by decide
example : specBelow 50 = false := by decide
example : specBelow 51 = false := by decide
example : specBelow 99 = false := by decide
example : specBelow 100 = false := by decide

example : thresholdPercent = specThreshold := agreeThreshold
example : percentScale = specScale := agreeScale
example : belowHalf 0 = specBelow 0 := agreeBelow 0
example : belowHalf 49 = specBelow 49 := agreeBelow 49
example : belowHalf 50 = specBelow 50 := agreeBelow 50
example : belowHalf 51 = specBelow 51 := agreeBelow 51
example : belowHalf 99 = specBelow 99 := agreeBelow 99
example : belowHalf 100 = specBelow 100 := agreeBelow 100

end JapanTaxLaw.InvestmentIncomeBelowHalf
