import JapanTaxLaw.LocalBusinessTaxRate77PerMille

/-!
# LocalBusinessTaxRate77PerMille tests — 7.7% の境界検査
Pinned to law 325CO0000000245 / art. 35の4の7. zero / small / below / at / above 1000.
-/

namespace JapanTaxLaw.LocalBusinessTaxRate77PerMille

example : rateAmount 0 = 0 := by decide
example : rateAmount 1 = 0 := by decide
example : rateAmount 76 = 5 := by decide
example : rateAmount 77 = 5 := by decide
example : rateAmount 78 = 6 := by decide
example : rateAmount 999 = 76 := by decide
example : rateAmount 1000 = 77 := by decide
example : rateAmount 1001 = 77 := by decide

end JapanTaxLaw.LocalBusinessTaxRate77PerMille
