import JapanTaxLaw.OilGasGrantArt4RoundingSpec

/-!
# OilGasGrantArt4Rounding tests — kernel-decided boundary checks

Pinned to law 340AC0000000157 / revision 340AC0000000157_20090401_421AC0000000009.
千円未満の端数を控除（切り捨て）。境界: 0 / 999 / 1000 / 1001。
-/

namespace JapanTaxLaw.OilGasGrantArt4Rounding

example : grantYenRounded 0 = 0 := by decide
example : grantYenRounded 1 = 0 := by decide
example : grantYenRounded 999 = 0 := by decide
example : grantYenRounded 1000 = 1000 := by decide
example : grantYenRounded 1001 = 1000 := by decide
example : grantYenRounded 2500 = 2000 := by decide
example : specRounded 999 = grantYenRounded 999 := by decide
example : specRounded 1001 = grantYenRounded 1001 := by decide

end JapanTaxLaw.OilGasGrantArt4Rounding
