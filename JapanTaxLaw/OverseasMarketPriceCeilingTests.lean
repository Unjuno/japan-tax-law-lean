import JapanTaxLaw.OverseasMarketPriceCeiling

/-!
# OverseasMarketPriceCeiling tests — kernel-decided boundary examples
Pinned to law 344M50000040016, revision 344M50000040016_20260401_508M60000040016, art. 2_4(2).
Unit: 円; ceiling 30000.
-/

namespace JapanTaxLaw.OverseasMarketPriceCeiling

example : withinCeiling 0 = true := by decide
example : withinCeiling 1 = true := by decide
example : withinCeiling 29999 = true := by decide
example : withinCeiling 30000 = true := by decide
example : withinCeiling 30001 = false := by decide
example : withinCeiling 60000 = false := by decide

end JapanTaxLaw.OverseasMarketPriceCeiling
