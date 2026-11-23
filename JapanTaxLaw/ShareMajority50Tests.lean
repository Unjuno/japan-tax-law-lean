import JapanTaxLaw.ShareMajority50
import JapanTaxLaw.ShareMajority50Spec

/-
# ShareMajority50Tests — kernel-decided boundary checks for 持分百分の五十超

Pinned: law 344M50000048001, revision 344M50000048001_20260601_508M60000048004.
STRICT majority: p = 50 fails (超える, NOT 以上); p = 51 qualifies.
Boundary categories: zero (0), small_input (1), threshold_below (49),
threshold_at (50, 100), threshold_above (51).
-/

namespace JapanTaxLaw.ShareMajority50

example : exceedsMajority 0 = false := by decide
example : exceedsMajority 1 = false := by decide
example : exceedsMajority 49 = false := by decide
example : exceedsMajority 50 = false := by decide
example : exceedsMajority 51 = true := by decide
example : exceedsMajority 100 = true := by decide

example : specExceeds 50 = false := by decide
example : specExceeds 51 = true := by decide

example : majorityPercent = specMajority := agreeMajority
example : percentScale = specScale := agreeScale
example : exceedsMajority 49 = specExceeds 49 := agreeExceeds 49
example : exceedsMajority 50 = specExceeds 50 := agreeExceeds 50
example : exceedsMajority 51 = specExceeds 51 := agreeExceeds 51

end JapanTaxLaw.ShareMajority50
