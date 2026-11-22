import JapanTaxLaw.InspectionCity

/-!
# InspectionCity tests — 検査対象市町村 smoke checks
Decidable smoke tests, pinned to law 333CO0000000117 / revision 333CO0000000117_20010106_412CO0000000304.
指定都市(0)/総務大臣指定市(1)→true、その他(2,3)→false。
-/

namespace JapanTaxLaw.InspectionCity

example : isInspectionCity 0 = true := by decide
example : isInspectionCity 1 = true := by decide
example : isInspectionCity 2 = false := by decide
example : isInspectionCity 3 = false := by decide

end JapanTaxLaw.InspectionCity
