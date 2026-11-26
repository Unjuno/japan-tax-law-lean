import JapanTaxLaw.FractionAmountsSpec

/-! Regression tests — fraction amounts, boundaries, universal agreement. -/

namespace JapanTaxLaw.FractionAmounts

example : fracAmount 0 1 2 = 0 := by decide
example : fracAmount 1 1 2 = 0 := by decide
example : fracAmount 3 2 3 = 2 := by decide
example : fracAmount 100 110 100 = 110 := by decide

example : fracAmount 123_456 17 10 = specFracAmount 123_456 17 10 :=
  fracAmount_agrees 123_456 17 10 (by decide)
example : fracAmount 123_456 100 75 = specFracAmount 123_456 100 75 :=
  fracAmount_agrees 123_456 100 75 (by decide)
example : fracAmount 123_456 110 100 = specFracAmount 123_456 110 100 :=
  fracAmount_agrees 123_456 110 100 (by decide)

end JapanTaxLaw.FractionAmounts
