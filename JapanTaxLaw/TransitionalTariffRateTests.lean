import JapanTaxLaw.TransitionalTariffRate

/-!
# TransitionalTariffRate tests — 関税定率法改正法 附則 art.2 smoke checks
Decidable smoke tests, pinned to law 143AC0000000054 / revision 143AC0000000054_20260601_508AC0000000005.
境界: 率B=1400、率D=139、リットル0。有限領域の smoke。
-/

namespace JapanTaxLaw.TransitionalTariffRate

example : rateB = 1_400 := by decide
example : rateD = 139 := by decide
example : tariff 0 rateB = 0 := by decide
example : tariff 1 rateB = 1_400 := by decide
example : tariff 1 rateD = 139 := by decide
example : tariff 10 rateB = 14_000 := by decide
example : tariff 10 rateD = 1_390 := by decide

end JapanTaxLaw.TransitionalTariffRate
