import JapanTaxLaw.DutyFreeTransfer

/-!
# DutyFreeTransfer tests — 関税法施行令 art.12 smoke checks
Decidable smoke tests, pinned to law 327CO0000000125 / revision 327CO0000000125_20171008_428CO0000000240.
境界: 17,999→true / 18,000→false / 18,001→false（「満たない」は厳密不等式）。有限領域の smoke。
-/

namespace JapanTaxLaw.DutyFreeTransfer

example : thresholdYen = 18_000 := by decide
example : isBelowThreshold 0 = true := by decide
example : isBelowThreshold 1 = true := by decide
example : isBelowThreshold 17_999 = true := by decide
example : isBelowThreshold 18_000 = false := by decide
example : isBelowThreshold 18_001 = false := by decide
example : isBelowThreshold 100_000 = false := by decide

end JapanTaxLaw.DutyFreeTransfer
