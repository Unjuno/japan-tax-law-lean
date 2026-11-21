import JapanTaxLaw.AntiDumpingRate694

/-!
# AntiDumpingRate694 tests — 不当廉売関税率 69.4% smoke checks
Decidable smoke tests, pinned to law 426CO0000000415 / revision 426CO0000000415_20150425_427CO0000000215.
税率 694/1000、価格 0/1000/10000。
-/

namespace JapanTaxLaw.AntiDumpingRate694

example : ratePerMille = 694 := by decide
example : dutyYen 0 = 0 := by decide
example : dutyYen 1000 = 694 := by decide
example : dutyYen 2000 = 1388 := by decide
example : dutyYen 10000 = 6940 := by decide

end JapanTaxLaw.AntiDumpingRate694
