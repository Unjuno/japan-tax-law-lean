import JapanTaxLaw.StandingTimberDeferredRate30

/-!
# StandingTimberDeferredRate30 tests — 30% 率の境界検査

Pinned to law 325CO0000000071 / revision 325CO0000000071_20260401_506CO0000000143.
zero / small input / just-below / at / just-above the statutory numerator 三十.
-/

namespace JapanTaxLaw.StandingTimberDeferredRate30

example : timberDeferredTax 0 = 0 := by decide
example : timberDeferredTax 1 = 0 := by decide
example : timberDeferredTax 29 = 8 := by decide
example : timberDeferredTax 30 = 9 := by decide
example : timberDeferredTax 31 = 9 := by decide
example : timberDeferredTax 99 = 29 := by decide
example : timberDeferredTax 100 = 30 := by decide
example : timberDeferredTax 1_000 = 300 := by decide

end JapanTaxLaw.StandingTimberDeferredRate30
