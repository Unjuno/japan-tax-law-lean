import JapanTaxLaw.StampExchangeFee

/-!
# StampExchangeFee tests — 印紙税法施行規則 art.9 smoke checks
Decidable smoke tests, pinned to law 415M60000008069 / revision 415M60000008069_20191001_501M60000008047.
境界: amount 9(半額4) / 10(5円) / 通常 5×枚数。
-/

namespace JapanTaxLaw.StampExchangeFee

example : perSheetYen = 5 := by decide
example : smallThresholdYen = 10 := by decide
example : halfFloor 0 = 0 := by decide
example : halfFloor 9 = 4 := by decide
example : exchangeFee 1 9 = 4 := by decide
example : exchangeFee 1 10 = 5 := by decide
example : exchangeFee 3 10 = 15 := by decide
example : exchangeFee 5 100 = 25 := by decide

end JapanTaxLaw.StampExchangeFee
