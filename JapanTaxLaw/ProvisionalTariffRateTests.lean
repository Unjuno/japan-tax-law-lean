import JapanTaxLaw.ProvisionalTariffRate

/-!
# ProvisionalTariffRate tests — 関税暫定措置法 附則 art.2-2 smoke checks
Decidable smoke tests, pinned to law 335AC0000000036 / revision 335AC0000000036_20260401_508AC0000000005.
境界: 1600/1300/1600/137 円/L、リットル0、桁違い検出。有限領域の smoke。
-/

namespace JapanTaxLaw.ProvisionalTariffRate

example : rate1D = 1_600 := by decide
example : rate2B = 1_300 := by decide
example : rate3G = 1_600 := by decide
example : rate4D = 137 := by decide
example : tariff 0 rate1D = 0 := by decide
example : tariff 1 rate1D = 1_600 := by decide
example : tariff 1 rate4D = 137 := by decide
example : tariff 10 rate2B = 13_000 := by decide
example : tariff 10 rate4D = 1_370 := by decide

end JapanTaxLaw.ProvisionalTariffRate
