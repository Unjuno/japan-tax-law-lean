import JapanTaxLaw.LocalSeparateIncomeTaxRate6

/-!
# LocalSeparateIncomeTaxRate6 tests — 6% の境界検査
Pinned to law 325AC0000000226 / art. 328の3. zero / small / below / at / above 六.
-/

namespace JapanTaxLaw.LocalSeparateIncomeTaxRate6

example : separateIncomeTax 0 = 0 := by decide
example : separateIncomeTax 1 = 0 := by decide
example : separateIncomeTax 5 = 0 := by decide
example : separateIncomeTax 6 = 0 := by decide
example : separateIncomeTax 7 = 0 := by decide
example : separateIncomeTax 99 = 5 := by decide
example : separateIncomeTax 100 = 6 := by decide
example : separateIncomeTax 101 = 6 := by decide

end JapanTaxLaw.LocalSeparateIncomeTaxRate6
