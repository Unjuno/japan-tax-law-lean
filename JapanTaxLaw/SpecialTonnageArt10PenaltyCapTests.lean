import JapanTaxLaw.SpecialTonnageArt10PenaltyCapSpec

/-!
# SpecialTonnageArt10PenaltyCap tests — kernel-decided boundary checks

Pinned to law 332AC0000000038 / revision 332AC0000000038_20250601_504AC0000000068.
境界: 2/3/4 年, 499999/500000/500001 円。
-/

namespace JapanTaxLaw.SpecialTonnageArt10PenaltyCap

example : withinCaps 0 0 = true := by decide
example : withinCaps 2 499999 = true := by decide
example : withinCaps 3 500000 = true := by decide
example : withinCaps 4 500000 = false := by decide
example : withinCaps 3 500001 = false := by decide
example : specWithinCaps 3 500000 = true := by decide
example : specWithinCaps 4 500000 = false := by decide
example : specWithinCaps 3 500001 = false := by decide

end JapanTaxLaw.SpecialTonnageArt10PenaltyCap
