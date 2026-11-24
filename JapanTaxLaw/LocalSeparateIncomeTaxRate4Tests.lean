import JapanTaxLaw.LocalSeparateIncomeTaxRate4

/-!
# LocalSeparateIncomeTaxRate4 tests — 4% の境界検査
Pinned to law 325AC0000000226 / art. 50の4. zero / small / below / at / above 四.
-/

namespace JapanTaxLaw.LocalSeparateIncomeTaxRate4

example : separateIncomeTax 0 = 0 := by decide
example : separateIncomeTax 1 = 0 := by decide
example : separateIncomeTax 3 = 0 := by decide
example : separateIncomeTax 4 = 0 := by decide
example : separateIncomeTax 5 = 0 := by decide
example : separateIncomeTax 99 = 3 := by decide
example : separateIncomeTax 100 = 4 := by decide
example : separateIncomeTax 101 = 4 := by decide

end JapanTaxLaw.LocalSeparateIncomeTaxRate4
