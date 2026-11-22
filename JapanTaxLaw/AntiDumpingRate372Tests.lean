import JapanTaxLaw.AntiDumpingRate372

/-!
# AntiDumpingRate372 tests — 不当廉売関税率 37.2% smoke checks
Decidable smoke tests, pinned to law 502CO0000000208 / revision 502CO0000000208_20200917_502CO0000000279.
税率 372/1000、価格 0/1000/10000。
-/

namespace JapanTaxLaw.AntiDumpingRate372

example : ratePerMille = 372 := by decide
example : dutyYen 0 = 0 := by decide
example : dutyYen 1000 = 372 := by decide
example : dutyYen 2000 = 744 := by decide
example : dutyYen 10000 = 3720 := by decide

end JapanTaxLaw.AntiDumpingRate372
