import JapanTaxLaw.LightOilDeliveryTaxRateSpec

/-!
# LightOilDeliveryTaxRateTests — kernel-checked checks for 地方税法 第百四十四条の十
-/

namespace JapanTaxLaw.LightOilDeliveryTaxRate

open JapanTaxLaw.TaxFinance

example : rateYenPerKilolitre = 15_000 := rfl
example : taxYen 1 = 15_000 := rfl
example : taxYen 3 = 45_000 := by decide
example (k : Money) : taxYen k = specTaxYen k := agree_tax k
example (k : Money) : rateYenPerKilolitre * k =
    Nat.rec 0 (fun _ acc => acc + rateYenPerKilolitre) k := mul_eq_accumulate k

end JapanTaxLaw.LightOilDeliveryTaxRate
