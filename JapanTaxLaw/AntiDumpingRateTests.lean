import JapanTaxLaw.AntiDumpingRate

/-!
# AntiDumpingRate tests — 不当廉売関税率 smoke checks
Decidable smoke tests, pinned to law 428CO0000000196 / revision 428CO0000000196_20210814_503CO0000000231.
税率 495/1000・737/1000、価格 0/1000/10000。
-/

namespace JapanTaxLaw.AntiDumpingRate

example : koreaRatePerMille = 495 := by decide
example : chinaRatePerMille = 737 := by decide
example : dutyYen koreaRatePerMille 0 = 0 := by decide
example : dutyYen koreaRatePerMille 1000 = 495 := by decide
example : dutyYen chinaRatePerMille 1000 = 737 := by decide
example : dutyYen koreaRatePerMille 10000 = 4950 := by decide
example : dutyYen chinaRatePerMille 10000 = 7370 := by decide

end JapanTaxLaw.AntiDumpingRate
