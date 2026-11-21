import JapanTaxLaw.AntiDumpingRate53

/-!
# AntiDumpingRate53 tests — 不当廉売関税率 53.0% smoke checks
Decidable smoke tests, pinned to law 429CO0000000234 / revision 429CO0000000234_20230204_505CO0000000028.
税率 530/1000、価格 0/1000/10000。
-/

namespace JapanTaxLaw.AntiDumpingRate53

example : ratePerMille = 530 := by decide
example : dutyYen 0 = 0 := by decide
example : dutyYen 1000 = 530 := by decide
example : dutyYen 2000 = 1060 := by decide
example : dutyYen 10000 = 5300 := by decide

end JapanTaxLaw.AntiDumpingRate53
