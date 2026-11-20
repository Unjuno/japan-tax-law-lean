import JapanTaxLaw.WeightTaxTransfer

/-!
# WeightTaxTransfer tests — 自動車重量譲与税法 art.2 smoke checks
Decidable smoke tests, pinned to law 346AC0000000090 / revision 346AC0000000090_20260401_508AC0000000002.
境界: 333/357、半分割、延長/面積按分、分母0。有限領域の smoke。
-/

namespace JapanTaxLaw.WeightTaxTransfer

example : transferBase 357 = 333 := by decide
example : transferBase 0 = 0 := by decide
example : allocation 357 1 2 1 2 = 166 := by decide
example : allocation 357 0 0 1 1 = 166 := by decide
example : allocation 357 1 1 0 0 = 166 := by decide
example : allocation 357 0 0 0 0 = 0 := by decide

end JapanTaxLaw.WeightTaxTransfer
