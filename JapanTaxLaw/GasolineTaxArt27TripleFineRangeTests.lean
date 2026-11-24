import JapanTaxLaw.GasolineTaxArt27TripleFineRangeSpec

/-!
# GasolineTaxArt27TripleFineRange tests — kernel-decided boundary checks

Pinned to law 332AC0000000055 / revision 332AC0000000055_20260525_506AC0000000052.
境界: 333333/333334 (三倍 vs 100万円), 999999/1000000/1000001, 倍率 2/3/4。
-/

namespace JapanTaxLaw.GasolineTaxArt27TripleFineRange

example : triple 0 = 0 := by decide
example : triple 2 = 6 := by decide
example : triple 3 = 9 := by decide
example : triple 4 = 12 := by decide
example : triple 333333 = 999999 := by decide
example : triple 333334 = 1000002 := by decide
example : specialApplies 333333 = false := by decide
example : specialApplies 333334 = true := by decide
example : withinFineRange 400000 1000000 = false := by decide
example : withinFineRange 400000 1200000 = true := by decide
example : specInRange 400000 1200001 = false := by decide

end JapanTaxLaw.GasolineTaxArt27TripleFineRange
