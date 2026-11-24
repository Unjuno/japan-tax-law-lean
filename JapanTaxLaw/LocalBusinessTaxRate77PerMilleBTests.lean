import JapanTaxLaw.LocalBusinessTaxRate77PerMilleB

/-!
# LocalBusinessTaxRate77PerMilleB tests — 7.7% の境界検査
Pinned to law 325CO0000000245 / art. 57の2の8. zero / small / below / at / above 1000.
-/

namespace JapanTaxLaw.LocalBusinessTaxRate77PerMilleB

example : rateAmount 0 = 0 := by decide
example : rateAmount 1 = 0 := by decide
example : rateAmount 76 = 5 := by decide
example : rateAmount 77 = 5 := by decide
example : rateAmount 78 = 6 := by decide
example : rateAmount 999 = 76 := by decide
example : rateAmount 1000 = 77 := by decide
example : rateAmount 1001 = 77 := by decide

end JapanTaxLaw.LocalBusinessTaxRate77PerMilleB
