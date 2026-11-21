import JapanTaxLaw.LandValuePerSquareMeter

/-!
# LandValuePerSquareMeter tests — 更地価額÷面積 smoke checks
Decidable smoke tests, pinned to law 403CO0000000174 / revision 403CO0000000174_20250722_507CO0000000249.
除算: 1000/10=100, 1000/3=333, area 0→0。
-/

namespace JapanTaxLaw.LandValuePerSquareMeter

example : valuePerSqm 0 1 = 0 := by decide
example : valuePerSqm 1000 1 = 1000 := by decide
example : valuePerSqm 1000 3 = 333 := by decide
example : valuePerSqm 1000 10 = 100 := by decide
example : valuePerSqm 9999 7 = 1428 := by decide
example : valuePerSqm 1000 0 = 0 := by decide

end JapanTaxLaw.LandValuePerSquareMeter
