import JapanTaxLaw.AntiDumpingRate308

/-!
# AntiDumpingRate308 tests — 不当廉売関税率 30.8% smoke checks
Decidable smoke tests, pinned to law 503CO0000000065 / revision 503CO0000000065_20260709_508CO0000000223.
税率 308/1000、価格 0/1000/10000。
-/

namespace JapanTaxLaw.AntiDumpingRate308

example : ratePerMille = 308 := by decide
example : dutyYen 0 = 0 := by decide
example : dutyYen 1000 = 308 := by decide
example : dutyYen 2000 = 616 := by decide
example : dutyYen 10000 = 3080 := by decide

end JapanTaxLaw.AntiDumpingRate308
