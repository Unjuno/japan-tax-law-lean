import JapanTaxLaw.GiftTaxSettlementBasicDeduction600k

/-!
# GiftTaxSettlementBasicDeduction600k tests — 60万円控除の境界検査
Pinned to law 325AC0000000073 / art. 21の11の2. zero / small / below / at / above 600000.
-/

namespace JapanTaxLaw.GiftTaxSettlementBasicDeduction600k

example : afterDeduction 0 = 0 := by decide
example : afterDeduction 1 = 0 := by decide
example : afterDeduction 599999 = 0 := by decide
example : afterDeduction 600000 = 0 := by decide
example : afterDeduction 600001 = 1 := by decide
example : afterDeduction 1000000 = 400000 := by decide

end JapanTaxLaw.GiftTaxSettlementBasicDeduction600k
