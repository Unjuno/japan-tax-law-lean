import JapanTaxLaw.CustomsFee76000

/-! # CustomsFee76000 tests — 7.6万/7.54万分岐 (law 329CO0000000164 / art.2) -/

namespace JapanTaxLaw.CustomsFee76000

example : fee false = 76_000 := by decide
example : fee true = 75_400 := by decide
example : fee true < fee false := by decide
example : fee false - fee true = 600 := by decide
example : fee true + 600 = fee false := by decide
example : fee false > fee true := by decide

end JapanTaxLaw.CustomsFee76000
