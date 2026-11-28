import JapanTaxLaw.LocalTaxArt20_2DeemedDelivery7Days
import JapanTaxLaw.LocalTaxArt20_2DeemedDelivery7DaysSpec

/-!
# LocalTaxArt20_2DeemedDelivery7DaysTests — kernel-decided regression checks

地方税法 art.20の2(3): delivery is deemed after 7 elapsed days, inclusive at the
boundary. Every assertion is kernel-decided; the enumerated grid is not
presented as a universal proof.
-/

namespace JapanTaxLaw.LocalTaxArt20_2DeemedDelivery7Days

example : deemedDays = 7 := by decide
example : specDays = 7 := by decide
example : isDeemedDelivered 0 = false := by decide
example : isDeemedDelivered 6 = false := by decide
example : isDeemedDelivered 7 = true := by decide
example : isDeemedDelivered 8 = true := by decide
example : isDeemedDelivered 14 = true := by decide
example : specDeemed 6 = false := by decide
example : specDeemed 7 = true := by decide
example : specDeemed 8 = true := by decide
example : 7 - 7 = 0 := by decide
example : agreeLocalTaxArt20_2DeemedDelivery7Days = true := by decide

end JapanTaxLaw.LocalTaxArt20_2DeemedDelivery7Days
