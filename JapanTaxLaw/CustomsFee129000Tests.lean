import JapanTaxLaw.CustomsFee129000

/-! # CustomsFee129000 tests — 12.9万/12.8万分岐 (law 329CO0000000164 / art.4) -/

namespace JapanTaxLaw.CustomsFee129000

example : fee false = 129_000 := by decide
example : fee true = 128_000 := by decide
example : fee true < fee false := by decide
example : fee false - fee true = 1_000 := by decide
example : fee true + 1_000 = fee false := by decide
example : fee false > fee true := by decide

end JapanTaxLaw.CustomsFee129000
