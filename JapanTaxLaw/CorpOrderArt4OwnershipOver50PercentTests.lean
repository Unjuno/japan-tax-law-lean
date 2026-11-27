import JapanTaxLaw.CorpOrderArt4OwnershipOver50PercentSpec

/-!
# CorpOrderArt4OwnershipOver50Percent tests — kernel-decided boundary checks

Pinned to law 340CO0000000097 / revision 340CO0000000097_20261001_507CO0000000121.
境界: 49/50/51（発行済100株に対する50%超）。
-/

namespace JapanTaxLaw.CorpOrderArt4OwnershipOver50Percent

example : exceeds50 0 100 = false := by decide
example : exceeds50 1 100 = false := by decide
example : exceeds50 49 100 = false := by decide
example : exceeds50 50 100 = false := by decide
example : exceeds50 51 100 = true := by decide
example : specExceeds 50 100 = false := by decide
example : specExceeds 51 100 = true := by decide
example : thresholdNumerator = specHalf := by decide

end JapanTaxLaw.CorpOrderArt4OwnershipOver50Percent
