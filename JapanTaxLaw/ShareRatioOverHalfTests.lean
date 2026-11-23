import JapanTaxLaw.ShareRatioOverHalf

/-!
# ShareRatioOverHalf tests — 持分50%超え smoke checks
Decidable smoke tests, pinned to law 344M50000048001 / revision 344M50000048001_20260601_508M60000048004.
50%厳密超え: 50/100 は対象外、51/100 は対象。
-/

namespace JapanTaxLaw.ShareRatioOverHalf

example : exceedsHalf 50 100 = false := by decide
example : exceedsHalf 51 100 = true := by decide
example : exceedsHalf 100 200 = false := by decide
example : exceedsHalf 101 200 = true := by decide

end JapanTaxLaw.ShareRatioOverHalf
