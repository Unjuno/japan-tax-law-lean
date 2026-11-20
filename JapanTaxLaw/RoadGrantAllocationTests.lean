import JapanTaxLaw.RoadGrantAllocation

/-!
# RoadGrantAllocation tests — 地方税等減収補てん臨時交付金政令 art.5 smoke checks
Decidable smoke tests, pinned to law 420AC0000000084 / revision 420AC0000000084_20081022_000000000000000.
境界: 総額、按分、分母0、基準額0。有限領域の smoke。
-/

namespace JapanTaxLaw.RoadGrantAllocation

example : totalGrant = 4_595_000_000 := by decide
example : allocation 1 10 = 459_500_000 := by decide
example : allocation 3 10 = 1_378_500_000 := by decide
example : allocation 10 10 = 4_595_000_000 := by decide
example : allocation 5 0 = 0 := by decide
example : allocation 0 10 = 0 := by decide

end JapanTaxLaw.RoadGrantAllocation
