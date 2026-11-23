import JapanTaxLaw.AviationFuelThousandRoundDown
import JapanTaxLaw.AviationFuelThousandRoundDownSpec

/-
# AviationFuelThousandRoundDown tests — 航空機燃料譲与税法 第四条（千円未満端数切捨て）

Kernel-decided boundary smoke checks pinned to law 347AC0000000013 /
revision 347AC0000000013_20240401_506AC0000000004 / literal 1000 (千円).
境界: 0, 1, 999→0, 1000→1000, 1001→1000, 1999→1000, 2000→2000, 5001→5000。
有限領域の smoke であり、普遍的な正しさを意味しない。
-/

namespace JapanTaxLaw.AviationFuelThousandRoundDown

example : roundingUnitYen = 1000 := by decide

example : roundDownThousand 0 = 0 := by decide

example : roundDownThousand 1 = 0 := by decide

example : roundDownThousand 999 = 0 := by decide

example : roundDownThousand 1000 = 1000 := by decide

example : roundDownThousand 1001 = 1000 := by decide

example : roundDownThousand 1999 = 1000 := by decide

example : roundDownThousand 2000 = 2000 := by decide

example : roundDownThousand 5001 = 5000 := by decide

example : roundedGrant 0 = 0 := by decide

example : roundedGrant 999 = 0 := by decide

example : roundedGrant 1000 = 1000 := by decide

example : roundedGrant 1001 = 1000 := by decide

example : roundedGrant 1999 = 1000 := by decide

example : roundedGrant 2000 = 2000 := by decide

example : roundedGrant 5001 = 5000 := by decide

example : specUnit = 1000 := by decide

example : specRound 0 = 0 := by decide

example : specRound 999 = 0 := by decide

example : specRound 1000 = 1000 := by decide

example : specRound 1001 = 1000 := by decide

example : specRound 1999 = 1000 := by decide

example : specRound 2000 = 2000 := by decide

example : specRound 5001 = 5000 := by decide

example : roundingUnitYen = specUnit := agreeUnit

example : roundDownThousand 0 = specRound 0 := agreeRound 0

example : roundDownThousand 999 = specRound 999 := agreeRound 999

example : roundDownThousand 1000 = specRound 1000 := agreeRound 1000

example : roundDownThousand 1001 = specRound 1001 := agreeRound 1001

example : roundDownThousand 1999 = specRound 1999 := agreeRound 1999

example : roundDownThousand 2000 = specRound 2000 := agreeRound 2000

example : roundDownThousand 5001 = specRound 5001 := agreeRound 5001

end JapanTaxLaw.AviationFuelThousandRoundDown
