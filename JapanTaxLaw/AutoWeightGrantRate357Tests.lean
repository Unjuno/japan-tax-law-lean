import JapanTaxLaw.AutoWeightGrantRate357

/-!
# AutoWeightGrantRate357 tests — kernel-decided boundary examples
Pinned to law 346AC0000000090, revision 346AC0000000090_20260401_508AC0000000002, art. 1(1).
Unit: 円; grant = floor(revenue * 357 / 1000).
-/

namespace JapanTaxLaw.AutoWeightGrantRate357

example : grantAmount 0 = 0 := by decide
example : grantAmount 1 = 0 := by decide
example : grantAmount 999 = 356 := by decide
example : grantAmount 1000 = 357 := by decide
example : grantAmount 1001 = 357 := by decide
example : grantAmount 10000 = 3570 := by decide
example : grantAmount 123456 = 44073 := by decide

end JapanTaxLaw.AutoWeightGrantRate357
