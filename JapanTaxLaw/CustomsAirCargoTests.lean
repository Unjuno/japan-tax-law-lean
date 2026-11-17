import JapanTaxLaw.CustomsAirCargo

/-!
# CustomsAirCargo tests — 関税定率法 art. 4の6 smoke checks

Decidable smoke tests, pinned to
  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 4の6(1): 航空貨物の運賃等代替
example : airFreightForValuation true 50_000 200_000 = 50_000 := by decide
example : airFreightForValuation false 50_000 200_000 = 200_000 := by decide
-- art. 4の6(2): 個人的使用品の卸価格みなし（携帯品・寄贈品を含む）
example : personalUseValue true 100_000 250_000 = 100_000 := by decide
example : personalUseValue false 100_000 250_000 = 250_000 := by decide
-- 境界: 0円
example : airFreightForValuation true 0 200_000 = 0 := by decide
example : personalUseValue true 0 250_000 = 0 := by decide

end JapanTaxLaw
