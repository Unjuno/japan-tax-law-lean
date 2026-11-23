import JapanTaxLaw.DividendTaxRate

/-!
# DividendTaxRate tests — 配当割 smoke checks
Decidable smoke tests, pinned to law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002.
税率5%: 1000→50, 10000→500。
-/

namespace JapanTaxLaw.DividendTaxRate

example : ratePercent = 5 := by decide
example : taxYen 0 = 0 := by decide
example : taxYen 1000 = 50 := by decide
example : taxYen 10000 = 500 := by decide

end JapanTaxLaw.DividendTaxRate
