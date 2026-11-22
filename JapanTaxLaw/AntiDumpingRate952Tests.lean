import JapanTaxLaw.AntiDumpingRate952

/-!
# AntiDumpingRate952 tests — 不当廉売関税率 95.2% smoke checks
Decidable smoke tests, pinned to law 507CO0000000095 / revision 507CO0000000095_20250703_507CO0000000240.
税率 952/1000、価格 0/1000/10000。
-/

namespace JapanTaxLaw.AntiDumpingRate952

example : ratePerMille = 952 := by decide
example : dutyYen 0 = 0 := by decide
example : dutyYen 1000 = 952 := by decide
example : dutyYen 2000 = 1904 := by decide
example : dutyYen 10000 = 9520 := by decide

end JapanTaxLaw.AntiDumpingRate952
