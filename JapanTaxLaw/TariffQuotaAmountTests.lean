import JapanTaxLaw.TariffQuotaAmount

/-!
# TariffQuotaAmount tests — 関税割当数量 smoke checks
Decidable smoke tests, pinned to law 417M60000200012 / revision 417M60000200012_20260401_507M60000200056.
割当数量 = 8000 トン。
-/

namespace JapanTaxLaw.TariffQuotaAmount

example : quotaTons = 8_000 := by decide
example : quotaTons > 0 := by decide

end JapanTaxLaw.TariffQuotaAmount
